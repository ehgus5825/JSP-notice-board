package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.dohyun.web.entity.Member;
import com.dohyun.web.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberConfirm")
public class Confirm_controller extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// 회원정보 등록으로부터 값을 받아옴. (신뢰있는 값) 
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String birthday = req.getParameter("birthday");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
				
		// 모든 값을 Member 개체로 만듬
		Member member = new Member(id, pwd, name, gender, birthday, phone, email);
		// MemberService 객체 생성
		MemberService service = new MemberService();
		
		// service.addMember() 메소드에 member 인스턴스를 넣어 회원 추가 
		int result = service.addMember(member);
		System.out.println("회원이 " + result + "명 만큼 추가되었습니다.");
		// 가입 완료로 넘어감. => confrim.jsp
		req.getRequestDispatcher("WEB-INF/view/member/confirm.jsp").forward(req, resp);
	}
}
