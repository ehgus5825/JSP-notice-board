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

@WebServlet("/agree")
public class Agree_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter writer = resp.getWriter();

		// session : 접속한 유저의 정보 => member
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// 로그인 중 => alert 후 뒤로가기
		if(member != null) {
			writer.println("<script>alert('로그아웃 후 가입해주시길 바랍니다.'); history.back();</script>");
		}
		// 로그아웃 중 => agree.jsp
		else {
			req.getRequestDispatcher("WEB-INF/view/member/agree.jsp").forward(req, resp);
		}
		writer.close();
	}
}
