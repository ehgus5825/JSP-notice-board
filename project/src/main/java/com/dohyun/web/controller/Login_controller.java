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
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/memberLogin")
public class Login_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter writer = resp.getWriter();

		// ������ ������ �α��� �Ǿ��ִ��� Ȯ���ϱ� ���� Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// �̹� �α����� �Ǿ� �ִٸ� alert �� �ڷΰ���
		if(member != null) {
			writer.println("<script>alert('�̹� �α����� �Ǿ��ֽ��ϴ�.'); history.back();</script>");
		}
		// �α����� �Ǿ� ���� �ʴٸ� �α��� ȭ������ �Ѿ => login.jsp
		else {
			req.getRequestDispatcher("WEB-INF/view/member/login.jsp").forward(req, resp);
		}
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �α��� form���κ��� ���� �޾ƿ�. (�ŷ��ִ� ��) 
		String mid = req.getParameter("username");
		String pwd = req.getParameter("password");
		
		PrintWriter writer = resp.getWriter();
		
		// memberService ��ü ����
		MemberService service = new MemberService();
		// service.getMember() �޼ҵ忡 id�� �־ id�� �ش��ϴ� member ��ü�� �޾ƿ�
		Member member = service.getMember(mid);
		
		// id�� ���εǴ� ���� �ִٸ�
		if(member != null) {
			// id�� ������ �� ���� ��ġ�Ѵٸ� �α��� 
			if(mid.equals(member.getMid()) && pwd.equals(member.getPwd())){
				// Session�� ����� member�� session���� �������
				HttpSession session = req.getSession();
				session.setAttribute("userMember", member);
				// Session�� �ð��� 1�ð����� ����
				session.setMaxInactiveInterval(60*60);
				// alert �� Ȩ ȭ������ ���ư�
				writer.println("<script>alert('�α����� �Ϸ�Ǿ����ϴ�.'); location.href='/index';</script>");
			}
			// id�� ������ ������ ���� �ٸ��ٸ� alert �� �ٽ� �α������� ���ư�
			else {
				writer.println("<script>alert('���̵�� ��й�ȣ�� Ȯ�����ּ���.'); location.href='/memberLogin';</script>");
			}
		}
		// id�� ���εǴ� ���� ���ٸ� alert �� �ٽ� �α������� ���ư�
		else {
			writer.println("<script>alert('���̵�� ��й�ȣ�� Ȯ�����ּ���.'); location.href='/memberLogin';</script>");
		}
		writer.close();
	}
}
