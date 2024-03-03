package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/join")
public class Join_controller extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		

		// 무조건 agree.jsp를 통해서 넘어와야 함 => doPost()	
		req.getRequestDispatcher("WEB-INF/view/member/join.jsp").forward(req, resp);
	}
}
