package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/memberLogout")
public class Logout_controller extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그아웃을 시키기 위해 Session을 받음 
		HttpSession session = req.getSession();
		// 세션 종료
		session.invalidate();

		PrintWriter writer = resp.getWriter();
		// 종료 후 alert 그리고 홈 화면으로 돌아감
		writer.println("<script>alert('로그아웃 되었습니다.'); location='/index' </script>");
	}
}
