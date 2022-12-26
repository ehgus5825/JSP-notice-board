package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.dohyun.web.entity.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/memberAgree")
public class Agree_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter writer = resp.getWriter();

		// 접속한 유저가 로그인 되어있는지 확인하기 위한 Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// 로그인이 되어있다면 alert 후 뒤로가기
		if(member != null) {
			writer.println("<script>alert('로그아웃 후 가입해주시길 바랍니다.'); history.back();</script>");
		}
		// 로그인이 되어 있지 않다면 가입 동의으로 넘어감 => agree.jsp
		else {
			req.getRequestDispatcher("WEB-INF/view/member/agree.jsp").forward(req, resp);
		}
		writer.close();
	}
}
