package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberJoin")
public class Join_controller extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// ������ Agree�� ������Ǹ� ���ؼ� �Ѿ�;� �� => doPost()
		// �Ѿ�Դٴ� ���� ������Ǹ� �ߴٴ� ��, ȸ������ ������� �Ѿ => join.jsp  
		req.getRequestDispatcher("WEB-INF/view/member/join.jsp").forward(req, resp);
	}
}
