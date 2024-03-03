package com.dohyun.web.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import com.dohyun.web.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dupl")
public class Dupl_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 중복 체크 대상 id
		String id = req.getParameter("id");
		
		// MemberService 객체를 생성 
		MemberService service = new MemberService();
		
		// 아이디 정규표현식
		String pattern = "^[a-z]+[a-z0-9]{5,19}$";  
	
		// 빈 id
		if(id.equals("")) {
			req.setAttribute("dupl", 0);
		}
		else {
			// 정규식에 부합하지 않는 아이디
			if(!(Pattern.matches(pattern, id))){		
				req.setAttribute("dupl", 1);
			}
			else {
				// 중복 아이디 존재
				if(service.duplMember(id) != 0) {
					req.setAttribute("dupl", 2);
				}
				// 사용 가능한 아이디
				else {
					req.setAttribute("dupl", 3);
				}
			}
		}
		
		// 0 : 아이디를 입력해주세요 / 1 : 양식을 올바르게 입력해주세요 / 2 : 이미 사용중인 아이디입니다. / 3 : 사용 가능한 아이디입니다.
		req.setAttribute("id", id);	// id를 다시 가져가서 화면 지워지지 않게 함.
		req.getRequestDispatcher("WEB-INF/view/member/join.jsp").forward(req, resp);
	}
}
