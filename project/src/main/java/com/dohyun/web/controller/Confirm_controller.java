package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.dohyun.web.entity.Member;
import com.dohyun.web.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberConfirm")
public class Confirm_controller extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// ȸ������ ������κ��� ���� �޾ƿ�. (�ŷ��ִ� ��) 
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String birthday = req.getParameter("birthday");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
				
		// ��� ���� Member ��ü�� ����
		Member member = new Member(id, pwd, name, gender, birthday, phone, email);
		// MemberService ��ü ����
		MemberService service = new MemberService();
		
		// service.addMember() �޼ҵ忡 member �ν��Ͻ��� �־� ȸ�� �߰� 
		int result = service.addMember(member);
		System.out.println("ȸ���� " + result + "�� ��ŭ �߰��Ǿ����ϴ�.");
		// ���� �Ϸ�� �Ѿ. => confrim.jsp
		req.getRequestDispatcher("WEB-INF/view/member/confirm.jsp").forward(req, resp);
	}
}
