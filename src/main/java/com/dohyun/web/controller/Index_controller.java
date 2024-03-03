package com.dohyun.web.controller;

import java.io.IOException;
import java.util.List;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.NoticeDTO;
import com.dohyun.web.service.NoticeGetService;

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

		// session : 접속한 유저의 정보 => member
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("userMember");

		// NoticeService 객체 생성
		NoticeGetService service = new NoticeGetService();
		List<NoticeDTO> list = null;
		List<NoticeDTO> list2 = null;

		// 최신글(list), 인기글(list2);

		// 관리자라면
		if (member != null && member.getRole().equals("ADMIN")) {
			// 비공개 + 공개 최신 게시글 5개 리스트
			list = service.getNoticeAdminNewestList();
			list2 = service.getNoticeAdminHitList();
		}
		// 일반회원이나 비회원 이라면
		else {
			// 공개된 최신 게시글 5개 리스트
			list = service.getNoticeNewestList();
			list2 = service.getNoticeHitList();
		}

		// index.jsp로 list, list2를 보낸다.
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.getRequestDispatcher("WEB-INF/view/index.jsp").forward(req, resp);
	}
}