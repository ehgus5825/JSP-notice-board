package com.dohyun.web.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import com.dohyun.web.service.MemberService;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberDupl")
public class Dupl_check_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 중복체크할 id를 받아옴
		String id = req.getParameter("id");
		
		// MemberService 객체를 생성 
		MemberService service = new MemberService();
		String pattern = "^[a-z]+[a-z0-9]{5,19}$";  // 올바른 아이디를 위한 정규식
	
		// 아이디가 비어있을때
		if(id.equals("")) {
			req.setAttribute("dupl", 0);
		}
		else {
			// 아이디가 정규식에 부합하지 않을때
			// Pattern.matches("정규식", "값")을 통해서 정규식과 부합하는지 확인
			if(!(Pattern.matches(pattern, id))){		
				req.setAttribute("dupl", 1);
			}
			else {
				// service.duplMember()에 id를 넣어서 해당 아이디가 존재하는지 확인
				// 0이 아니라면 아이디가 존재
				if(service.duplMember(id) != 0) {
					req.setAttribute("dupl", 2);
				}
				// 0이라면 아이디가 존재하지 않음
				else {
					req.setAttribute("dupl", 3);
				}
			}
		}
		// 0 => 아이디를 입력해주세요 / 1 => 양식을 올바르게 입력해주세요 / 2 => 이미 사용중인 아이디입니다. / 3 => 사용 가능한 아이디입니다.
		req.setAttribute("id", id);
		// dupl과 id를 가지고 다시 회원 정보 등록으로 넘어감 => join.jsp
		req.getRequestDispatcher("WEB-INF/view/member/join.jsp").forward(req, resp);
	}
}
