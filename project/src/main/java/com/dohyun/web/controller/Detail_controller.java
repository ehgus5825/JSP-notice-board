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
		// 상세 조회할 게시글의 id를 받은 후 예외처리
		String nid_ = req.getParameter("id");
		int nid = (nid_==null)?1:(nid_=="")?1:Integer.parseInt(nid_); // 기본값 => 1
		
		// 다음글과 이전글에 검색 필드와 검색 내용이 영향을 주기 때문에 받아옴 그리고 예외처리
		String field = req.getParameter("f");
		String query = req.getParameter("q");   
		field = (field==null)?"title":(field=="")?"title":field; // 기본값 => "title"
		query = (query==null)?"":query; 						 // 기본값 => ""
		
		// 접속한 유저가 관리자인지 확인하기 위한 session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// NoticeService 객체 생성
		NoticeService service = new NoticeService();
		
		// service.getNotice(nid)를 통해 상세 조회할 게시글의 내용을 받아옴 
		Notice notice = service.getNotice(nid);
		
		// 상세 조회 글의 다음 글
		Notice nextNotice = null;
		// 상세 조회 글의 이전 글
		Notice prevNotice = null;
		
		// 비회원이라면 공개되어 있는 글 중에 다음이나 이전을 찾아야함.
		if(member == null) {
			nextNotice = service.getNextNotice(nid, field, query);	// 다음
			prevNotice = service.getPrevNotice(nid, field, query);  // 이전
			// service.getNextNotice(nid, field, query)와 service.getPrevNotice(nid, field, query)을 통해서 다음과 이전 글의 내용을 받아옴
		}
		// 회원이라면
		else {
			// 관리자라면 공개/비공개, 모든 글 중에 다음이나 이전을 찾아야함.
			if(member.getRole().equals("ADMIN")) {
				nextNotice = service.getNextAdminNotice(nid, field, query);  // 다음
				prevNotice = service.getPrevAdminNotice(nid, field, query);  // 이전
				// service.getNextAdminNotice(nid, field, query)와 service.getPrevAdminNotice(nid, field, query)을 통해서 다음과 이전 글의 내용을 받아옴
			}
			// 일반회원이라면 공개되어 있는 글 중에 다음이나 이전을 찾아야함.
			else{
				nextNotice = service.getNextNotice(nid, field, query);  // 다음
				prevNotice = service.getPrevNotice(nid, field, query);  // 이전
				// 비회원과 동일
			}
		}
		
		req.setAttribute("n", notice);
		req.setAttribute("nextN", nextNotice);
		req.setAttribute("pervN", prevNotice);
		// 공지사항 상세 조회로 넘어감 . => detail.jsp
	    req.getRequestDispatcher("WEB-INF/view/notice/detail.jsp").forward(req, resp);
	}
}
