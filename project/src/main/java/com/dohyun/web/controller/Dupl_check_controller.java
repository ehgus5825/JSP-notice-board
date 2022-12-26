package com.dohyun.web.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import com.dohyun.web.service.MemberService;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberDupl")
public class Dupl_check_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �ߺ�üũ�� id�� �޾ƿ�
		String id = req.getParameter("id");
		
		// MemberService ��ü�� ���� 
		MemberService service = new MemberService();
		String pattern = "^[a-z]+[a-z0-9]{5,19}$";  // �ùٸ� ���̵� ���� ���Խ�
	
		// ���̵� ���������
		if(id.equals("")) {
			req.setAttribute("dupl", 0);
		}
		else {
			// ���̵� ���ԽĿ� �������� ������
			// Pattern.matches("���Խ�", "��")�� ���ؼ� ���Խİ� �����ϴ��� Ȯ��
			if(!(Pattern.matches(pattern, id))){		
				req.setAttribute("dupl", 1);
			}
			else {
				// service.duplMember()�� id�� �־ �ش� ���̵� �����ϴ��� Ȯ��
				// 0�� �ƴ϶�� ���̵� ����
				if(service.duplMember(id) != 0) {
					req.setAttribute("dupl", 2);
				}
				// 0�̶�� ���̵� �������� ����
				else {
					req.setAttribute("dupl", 3);
				}
			}
		}
		// 0 => ���̵� �Է����ּ��� / 1 => ����� �ùٸ��� �Է����ּ��� / 2 => �̹� ������� ���̵��Դϴ�. / 3 => ��� ������ ���̵��Դϴ�.
		req.setAttribute("id", id);
		// dupl�� id�� ������ �ٽ� ȸ�� ���� ������� �Ѿ => join.jsp
		req.getRequestDispatcher("WEB-INF/view/member/join.jsp").forward(req, resp);
	}
}
