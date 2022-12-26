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

		// ������ ������ �α��� �Ǿ��ִ��� Ȯ���ϱ� ���� Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// �α����� �Ǿ��ִٸ� alert �� �ڷΰ���
		if(member != null) {
			writer.println("<script>alert('�α׾ƿ� �� �������ֽñ� �ٶ��ϴ�.'); history.back();</script>");
		}
		// �α����� �Ǿ� ���� �ʴٸ� ���� �������� �Ѿ => agree.jsp
		else {
			req.getRequestDispatcher("WEB-INF/view/member/agree.jsp").forward(req, resp);
		}
		writer.close();
	}
}
