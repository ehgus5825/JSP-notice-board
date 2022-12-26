package com.dohyun.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/noticeDetail")
public class Detail_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �� ��ȸ�� �Խñ��� id�� ���� �� ����ó��
		String nid_ = req.getParameter("id");
		int nid = (nid_==null)?1:(nid_=="")?1:Integer.parseInt(nid_); // �⺻�� => 1
		
		// �����۰� �����ۿ� �˻� �ʵ�� �˻� ������ ������ �ֱ� ������ �޾ƿ� �׸��� ����ó��
		String field = req.getParameter("f");
		String query = req.getParameter("q");   
		field = (field==null)?"title":(field=="")?"title":field; // �⺻�� => "title"
		query = (query==null)?"":query; 						 // �⺻�� => ""
		
		// ������ ������ ���������� Ȯ���ϱ� ���� session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
		
		// service.getNotice(nid)�� ���� �� ��ȸ�� �Խñ��� ������ �޾ƿ� 
		Notice notice = service.getNotice(nid);
		
		// �� ��ȸ ���� ���� ��
		Notice nextNotice = null;
		// �� ��ȸ ���� ���� ��
		Notice prevNotice = null;
		
		// ��ȸ���̶�� �����Ǿ� �ִ� �� �߿� �����̳� ������ ã�ƾ���.
		if(member == null) {
			nextNotice = service.getNextNotice(nid, field, query);	// ����
			prevNotice = service.getPrevNotice(nid, field, query);  // ����
			// service.getNextNotice(nid, field, query)�� service.getPrevNotice(nid, field, query)�� ���ؼ� ������ ���� ���� ������ �޾ƿ�
		}
		// ȸ���̶��
		else {
			// �����ڶ�� ����/�����, ��� �� �߿� �����̳� ������ ã�ƾ���.
			if(member.getRole().equals("ADMIN")) {
				nextNotice = service.getNextAdminNotice(nid, field, query);  // ����
				prevNotice = service.getPrevAdminNotice(nid, field, query);  // ����
				// service.getNextAdminNotice(nid, field, query)�� service.getPrevAdminNotice(nid, field, query)�� ���ؼ� ������ ���� ���� ������ �޾ƿ�
			}
			// �Ϲ�ȸ���̶�� �����Ǿ� �ִ� �� �߿� �����̳� ������ ã�ƾ���.
			else{
				nextNotice = service.getNextNotice(nid, field, query);  // ����
				prevNotice = service.getPrevNotice(nid, field, query);  // ����
				// ��ȸ���� ����
			}
		}
		
		req.setAttribute("n", notice);
		req.setAttribute("nextN", nextNotice);
		req.setAttribute("pervN", prevNotice);
		// �������� �� ��ȸ�� �Ѿ . => detail.jsp
	    req.getRequestDispatcher("WEB-INF/view/notice/detail.jsp").forward(req, resp);
	}
}
