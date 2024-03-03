package com.dohyun.web.controller;

import java.io.IOException;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.NoticeDTO;
import com.dohyun.web.service.NoticeGetService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/detail")
public class Detail_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 예외처리 : id(식별자), f(검색 필드), q(검색 내용), l(게시판 or 마이페이지)
		String nid_ = req.getParameter("id");
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		String listFlag = req.getParameter("l");

		// 기본값 : 1, "title", "", "1"
		int nid = (nid_ == null) ? 1 : (nid_ == "") ? 1 : Integer.parseInt(nid_);
		field = (field == null) ? "title" : (field == "") ? "title" : field;
		query = (query == null) ? "" : query;
		listFlag = (listFlag == null) ? "1" : (listFlag == "") ? "1" : listFlag;

		// session : 접속한 유저의 정보 => member
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("userMember");

		// NoticeService 객체 생성
		NoticeGetService service = new NoticeGetService();

		// 게시글 상세 조회
		NoticeDTO notice = service.getNotice(nid);

		// 게시글의 다음 글
		NoticeDTO nextNotice = null;
		// 게시글의 이전 글
		NoticeDTO prevNotice = null;

		// 1 이면 => 게시판
		if (listFlag.equals("1")) {
			// 관리자 : 공개/비공개 
			if (member != null && member.getRole().equals("ADMIN")) {
				nextNotice = service.getNextAdminNotice(nid, field, query); // 다음
				prevNotice = service.getPrevAdminNotice(nid, field, query); // 이전
			}
			// 비회원 & 일반회원 : 공개
			else {
				nextNotice = service.getNextNotice(nid, field, query); // 다음
				prevNotice = service.getPrevNotice(nid, field, query); // 이전
			}
		}

		// 2이면 => 마이페이지
		else {
			// 작성자 한정 (접속한 유저)
			nextNotice = service.getNextMyNotice(nid, member.getMid(), field, query);
			prevNotice = service.getPrevMyNotice(nid, member.getMid(), field, query);
		}

		req.setAttribute("n", notice);
		req.setAttribute("nextN", nextNotice);
		req.setAttribute("pervN", prevNotice);
		req.getRequestDispatcher("WEB-INF/view/notice/detail.jsp").forward(req, resp);
	}
}
