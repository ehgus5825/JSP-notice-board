package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberMyDelete")
public class MyDelete_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ������ �� �Խñ��� id�� �޾ƿ�
		int id = Integer.parseInt(req.getParameter("id"));
		// NoticeService ����
		NoticeService service = new NoticeService();
		// service.removeNotice() �޼ҵ忡 id�� �־ id�� �´� �Խñ��� ����
		int result = service.removeNotice(id);
		
		System.out.println("�����Ͱ� " + result + "����ŭ �����Ǿ����ϴ�.");
		
		// �� �� ������� ���ư�
		resp.sendRedirect("memberMyPage");
	}
}
