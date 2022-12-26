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
		// �α׾ƿ��� ��Ű�� ���� Session�� ���� 
		HttpSession session = req.getSession();
		// ���� ����
		session.invalidate();

		PrintWriter writer = resp.getWriter();
		// ���� �� alert �׸��� Ȩ ȭ������ ���ư�
		writer.println("<script>alert('�α׾ƿ� �Ǿ����ϴ�.'); location='/index' </script>");
	}
}
