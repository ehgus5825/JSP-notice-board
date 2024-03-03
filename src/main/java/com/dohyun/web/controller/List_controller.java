package com.dohyun.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.NoticeDTO;
import com.dohyun.web.service.NoticeGetService;
import com.dohyun.web.service.NoticeSetService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/list")
public class List_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 예외처리 : p(페이지), f(검색 필드), q(검색 내용), l(게시판 or 마이페이지), o(최신순 or 인기순)
		String page_ = req.getParameter("p");
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		String listFlag = req.getParameter("l");
		String orderFlag = req.getParameter("o");

		// 기본값 : 1 & "title" & "" & "1" & "REGDATE"
		int page = (page_ == null) ? 1 : (page_ == "") ? 1 : Integer.parseInt(page_);
		field = (field == null) ? "title" : (field == "") ? "title" : field;
		query = (query == null) ? "" : query;
		listFlag = (listFlag == null) ? "1" : (listFlag == "") ? "1" : listFlag;
		orderFlag = (orderFlag == null) ? "REGDATE" : (orderFlag == "") ? "REGDATE" : orderFlag;

		// session : 접속한 유저의 정보 => member
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("userMember");

		// NoticeService 객체 생성
		NoticeGetService service = new NoticeGetService();

		// 목록과 게시글 개수

		// 1 이면 => 게시판
		if (listFlag.equals("1")) {

			// 비회원 & 일반회원 : 공개
			List<NoticeDTO> list1 = service.getNoticeList(field, query, page, orderFlag);
			int count1 = service.getNoticeCount(field, query);

			// 관리자 : 공개/비공개
			List<NoticeDTO> list2 = service.getNoticeAdminList(field, query, page, orderFlag);
			int count2 = service.getNoticeAdminCount(field, query);

			req.setAttribute("list1", list1);
			req.setAttribute("count1", count1);
			req.setAttribute("list2", list2);
			req.setAttribute("count2", count2);
			req.getRequestDispatcher("WEB-INF/view/notice/notice.jsp").forward(req, resp);
		}

		// 2이면 => 마이페이지
		else {

			// 작성자 한정 (접속한 유저)
			List<NoticeDTO> list3 = service.getMyNoticeList(field, query, page, orderFlag, member.getMid());
			int count3 = service.getMyNoticeCount(field, query, member.getMid());

			req.setAttribute("list3", list3);
			req.setAttribute("count3", count3);
			req.getRequestDispatcher("WEB-INF/view/member/myPage.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 일괄 공개 or 일괄 삭제
		String btn = req.getParameter("btn");

		// 공개 : open_ids_ | 비공개 : (list_ids_ - open_ids) | 삭제 : del_ids_
		String[] open_ids_ = req.getParameterValues("open_id");
		String[] del_ids_ = req.getParameterValues("del_id");
		String[] list_ids_ = req.getParameter("ids").trim().split(" "); // 전체 id

		// 예외처리 : l(게시판 or 마이페이지) / 기본값 : "1"
		String listFlag = req.getParameter("l");
		listFlag = (listFlag == null) ? "1" : (listFlag == "") ? "1" : listFlag;
		
		// NoticeService 객체 생성
		NoticeSetService service = new NoticeSetService();

		// 일괄 공개
		if (btn.equals("일괄공개")) {
			
			List<String> oid;
			
			// oid : 공개될 id들의 배열 or 빈 배열
			if (open_ids_ != null)
				oid = Arrays.asList(open_ids_);
			else
				oid = Arrays.asList();

			// cid : 비공개될 id들의 배열 or 빈 배열
			List<String> cid = new ArrayList<>(Arrays.asList(list_ids_));

			// cid : list_ids_ - open_ids_
			cid.removeAll(oid);

			// 일괄 공개 / 일괄 비공개 동시에 실행
			int result = service.pubNoticeAll(oid, cid);
			System.out.println("데이터가 " + result + "개만큼 수정되었습니다.");	// result == 10
		}
		
		// 일괄 삭제
		else if (btn.equals("일괄삭제") && del_ids_ != null) {
			
			// String[] => int[]
			int[] del_ids = new int[del_ids_.length];
			for (int i = 0; i < del_ids_.length; i++)
				del_ids[i] = Integer.parseInt(del_ids_[i]);

			// 일괄 삭제 실행
			int result = service.removeNoticeAll(del_ids);

			System.out.println("데이터가 " + result + "개만큼 삭제되었습니다.");
		}

		// 글 목록으로 돌아감
		resp.sendRedirect("list?l=" + listFlag);	// del_ids_ == null 라면 바로 돌아감	 
	}
}
