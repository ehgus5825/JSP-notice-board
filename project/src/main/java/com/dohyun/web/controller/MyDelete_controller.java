package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/memberMyDelete")
public class MyDelete_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 지워야 할 게시글의 id를 받아옴
		int id = Integer.parseInt(req.getParameter("id"));
		// NoticeService 생성
		NoticeService service = new NoticeService();
		// service.removeNotice() 메소드에 id를 넣어서 id에 맞는 게시글을 삭제
		int result = service.removeNotice(id);
		
		System.out.println("데이터가 " + result + "개만큼 삭제되었습니다.");
		
		// 내 글 목록으로 돌아감
		resp.sendRedirect("memberMyPage");
	}
}
