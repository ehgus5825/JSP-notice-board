package com.dohyun.web.controller;

import java.io.IOException;

import com.dohyun.web.service.NoticeSetService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class Delete_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 예외처리 : id(식별자), l(게시판 or 마이페이지)	/ 기본값 : 1, "1"
		String nid_ = req.getParameter("id");
		String listFlag = req.getParameter("l");
		
		int nid = (nid_ == null) ? 1 : (nid_ == "") ? 1 : Integer.parseInt(nid_);
		listFlag = (listFlag == null) ? "1" : (listFlag == "") ? "1" : listFlag;
				
		// NoticeService 생성
		NoticeSetService service = new NoticeSetService();
		
		// 게시글 삭제
		int result = service.removeNotice(nid);
		System.out.println("데이터가 " + result + "개만큼 삭제되었습니다.");
		
		// 목록으로 돌아감
		resp.sendRedirect("list?l=" + listFlag);
	}
}
