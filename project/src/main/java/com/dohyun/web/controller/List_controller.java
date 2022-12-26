package com.dohyun.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.dohyun.web.entity.NoticeView;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/noticeList")
public class List_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		// �������� �˻� �ʵ�, �˻�� ���� ����� ����ؾ� �ϱ� ������ ���� �޾ƿ� �� ����ó��
		String page_ = req.getParameter("p");
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		field = (field==null)?"title":(field=="")?"title":field; 		  // �⺻�� : "title"
		query = (query==null)?"":query;							 		  // �⺻�� : ""
		int page = (page_==null)?1:(page_=="")?1:Integer.parseInt(page_); // �⺻�� : 1
		
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
		
		// ��� �ޱ�
		// list1 => service.getNoticeViewList(field, query, page)���� ������ �۵鸸 ���ȭ
		List<NoticeView> list1 = service.getNoticeViewList(field, query, page);
		// list2 => service.getNoticeViewAdminList(field, query, page)���� ��� �۵��� ���ȭ
		List<NoticeView> list2 = service.getNoticeViewAdminList(field, query, page);
		
		// �Խñ� ��ü ���� �ޱ�
		// count1 => service.getNoticeCount(field, query)���� ������ ���� ������ �޾ƿ�
		int count1 = service.getNoticeCount(field, query);
		// count1 => service.getNoticeCount(field, query)���� ��� ���� ������ �޾ƿ�
		int count2 = service.getNoticeAdminCount(field, query);
		
		// ���
		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);
		req.setAttribute("count1", count1);
		req.setAttribute("count2", count2);
		// �� ��� ��ȸ�� �Ѿ
		req.getRequestDispatcher("WEB-INF/view/notice/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
		
		// ����, ������ üũ�ڽ��κ��� id ���� �޾ƿ�
		String[] open_ids_ = req.getParameterValues("open_id");			// ���� => open_ids_
		String[] del_ids_ = req.getParameterValues("del_id");			// ���� => del_ids_
		String[] list_ids_ = req.getParameter("ids").trim().split(" ");	// ��ü id => list_idd_
		String btn = req.getParameter("btn");							// �ϰ� ���� or �ϰ� ����
		
		// btn�� "�ϰ� ����"���
		if(btn.equals("�ϰ�����")) {
			List<String> oid;
			if(open_ids_ != null)					// ������ id���� ������� �ʴٸ� 
				oid = Arrays.asList(open_ids_);		// => oid ����Ʈ�� open_ids_ �߰�
			else									// ����ִٸ�
				oid = Arrays.asList();				// => oid ����Ʈ�� �� �迭 ����
			
			// cid => ������ؾ��� id�� ���� // �ϴ� ��ü id���� �־��ش�.
			List<String> cid = new ArrayList<>(Arrays.asList(list_ids_));
			// �׸��� ��ü id�� �� ������ id���� �������ش�. => ������� id ����
			cid.removeAll(oid);
			
			// service.pubNoticeAll() �޼ҵ忡 ������ id��� ������� id���� �ο��ؼ� �ϰ�����/����� ����
			int result = service.pubNoticeAll(oid, cid);
			
			System.out.println("�����Ͱ� " + result + "����ŭ �����Ǿ����ϴ�."); 
		}
		// btn�� "�ϰ� ����"�̰� ������ id���� ������� �ʴٸ� 
		else if(btn.equals("�ϰ�����") && del_ids_ != null) {
			// int�� �迭�� del_ids_�� ����ȯ�Ͽ� ������
			int[] del_ids = new int[del_ids_.length];
			for(int i = 0; i < del_ids_.length; i++)
				del_ids[i] = Integer.parseInt(del_ids_[i]);
			
			// service.removeNoticeAll() �޼ҵ忡 �ռ����� ������ id���� �־ �ϰ� ���� ����
			int result = service.removeNoticeAll(del_ids);
				
			System.out.println("�����Ͱ� " + result + "����ŭ �����Ǿ����ϴ�.");
		}
		
		// �� ������� ���ư�
		resp.sendRedirect("noticeList");
	}
}
