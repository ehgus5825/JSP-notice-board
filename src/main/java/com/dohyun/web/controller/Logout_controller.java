package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout_controller extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//  session : 접속한 유저의 정보
		HttpSession session = req.getSession();
		
		// 세션 종료 => 로그아웃
		session.invalidate();

		PrintWriter writer = resp.getWriter();
		
		// alert 이후 index 이동
		writer.println("<script>alert('로그아웃 되었습니다.'); location.href='/index' </script>");
	}
}
