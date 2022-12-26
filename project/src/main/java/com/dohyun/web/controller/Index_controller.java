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
		// 접속한 유저가 관리자인지 확인하기 위한 session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// NoticeService 객체 생성
		NoticeService service = new NoticeService();
	    List<Notice> list = null;
	    
	    // 비회원이라면
	    if(member == null) {
	    	// 공개된 최신 게시글 5개 리스트
	    	list = service.getNoticeNewestList();
	    }
	    // 회원이라면
	    else {
	    	// 관리자라면
	    	if(member.getRole().equals("ADMIN")) {
		    	// 비공개 + 공개 최신 게시글 5개 리스트
	    		list = service.getNoticeAdminNewestList(); 
	    	}
	    	// 일반회원이라면
	    	else {
		    	// 공개된 최신 게시글 5개 리스트
	    		list = service.getNoticeNewestList();
	    	}
	    }
	    
	    // index.jsp로 list를 보낸다. 
	    req.setAttribute("list", list);
	    req.getRequestDispatcher("WEB-INF/view/index.jsp").forward(req, resp);	   
	}
}