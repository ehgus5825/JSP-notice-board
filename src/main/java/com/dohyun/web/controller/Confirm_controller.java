package com.dohyun.web.controller;

import java.io.IOException;

import com.dohyun.web.entity.Member;
import com.dohyun.web.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/confirm")
public class Confirm_controller extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 예외처리된 form의 내용
		String id = req.getParameter("id_");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String birthday = req.getParameter("birthday");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");

		// MemberService 객체 생성
		MemberService service = new MemberService();

		// 회원 생성
		int result = service.addMember(id, pwd, name, gender, birthday, phone, email);
		System.out.println("회원이 " + result + "명 만큼 추가되었습니다.");

		req.getRequestDispatcher("WEB-INF/view/member/confirm.jsp").forward(req, resp);
	}
}
