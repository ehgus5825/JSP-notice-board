package com.dohyun.web.controller;

import java.io.IOException;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/memberMyDetail")
public class MyDetail_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �� ��ȸ�� �Խñ��� id�� ���� �� ����ó��
		String nid_ = req.getParameter("id");
		int nid = (nid_==null)?1:(nid_=="")?1:Integer.parseInt(nid_); // �⺻�� - nid : 1

		// �����۰� �����ۿ� �˻� �ʵ�� �˻� ������ ������ �ֱ� ������ �޾ƿ� �׸��� ����ó��
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		field = (field==null)?"title":(field=="")?"title":field; // �⺻�� => "title"
		query = (query==null)?"":query;							 // �⺻�� => ""
		
		// ������ ������ �۸� ����, �����ۿ� �α� ���� Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
		
		// service.getNotice(nid)�� ���� �� ��ȸ�� �Խñ��� ������ �޾ƿ�
		Notice notice = service.getNotice(nid);

		// �� ��ȸ ���� ���� �� / service.getNextMyNotice()�� mid�� �߰������� �־ �������� �۷θ� �߷��� ������ ��õ
		Notice nextNotice = service.getNextMyNotice(nid, member.getMid(), field, query);
		// �� ��ȸ ���� ���� �� / service.getPrevMyNotice()�� mid�� �߰������� �־ �������� �۷θ� �߷��� ������ ��õ
		Notice prevNotice = service.getPrevMyNotice(nid, member.getMid(), field, query);
		
		// ���
		req.setAttribute("n", notice);
		req.setAttribute("nextN", nextNotice);
		req.setAttribute("pervN", prevNotice);		
		// �������� �� ��ȸ�� �Ѿ . => myDetail.jsp
		req.getRequestDispatcher("/WEB-INF/view/member/myDetail.jsp").forward(req, resp);
	}
}
