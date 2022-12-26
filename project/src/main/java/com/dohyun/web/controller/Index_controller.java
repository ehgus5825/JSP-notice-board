package com.dohyun.web.controller;

import java.io.IOException;
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

@WebServlet("/index")
public class Index_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ������ ������ ���������� Ȯ���ϱ� ���� session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
	    List<Notice> list = null;
	    
	    // ��ȸ���̶��
	    if(member == null) {
	    	// ������ �ֽ� �Խñ� 5�� ����Ʈ
	    	list = service.getNoticeNewestList();
	    }
	    // ȸ���̶��
	    else {
	    	// �����ڶ��
	    	if(member.getRole().equals("ADMIN")) {
		    	// ����� + ���� �ֽ� �Խñ� 5�� ����Ʈ
	    		list = service.getNoticeAdminNewestList(); 
	    	}
	    	// �Ϲ�ȸ���̶��
	    	else {
		    	// ������ �ֽ� �Խñ� 5�� ����Ʈ
	    		list = service.getNoticeNewestList();
	    	}
	    }
	    
	    // index.jsp�� list�� ������. 
	    req.setAttribute("list", list);
	    req.getRequestDispatcher("WEB-INF/view/index.jsp").forward(req, resp);	   
	}
}