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
		// 페이지와 검색 필드, 검색어에 따라 목록을 출력해야 하기 때문에 값을 받아온 후 예외처리
		String page_ = req.getParameter("p");
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		field = (field==null)?"title":(field=="")?"title":field; 		  // 기본값 : "title"
		query = (query==null)?"":query;							 		  // 기본값 : ""
		int page = (page_==null)?1:(page_=="")?1:Integer.parseInt(page_); // 기본값 : 1
		
		// NoticeService 객체 생성
		NoticeService service = new NoticeService();
		
		// 목록 받기
		// list1 => service.getNoticeViewList(field, query, page)으로 공개된 글들만 목록화
		List<NoticeView> list1 = service.getNoticeViewList(field, query, page);
		// list2 => service.getNoticeViewAdminList(field, query, page)으로 모든 글들을 목록화
		List<NoticeView> list2 = service.getNoticeViewAdminList(field, query, page);
		
		// 게시글 전체 개수 받기
		// count1 => service.getNoticeCount(field, query)으로 공개된 글의 개수를 받아옴
		int count1 = service.getNoticeCount(field, query);
		// count1 => service.getNoticeCount(field, query)으로 모든 글의 개수를 받아옴
		int count2 = service.getNoticeAdminCount(field, query);
		
		// 출력
		req.setAttribute("list1", list1);
		req.setAttribute("list2", list2);
		req.setAttribute("count1", count1);
		req.setAttribute("count2", count2);
		// 글 목록 조회로 넘어감
		req.getRequestDispatcher("WEB-INF/view/notice/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// NoticeService 객체 생성
		NoticeService service = new NoticeService();
		
		// 공개, 삭제의 체크박스로부터 id 값을 받아옴
		String[] open_ids_ = req.getParameterValues("open_id");			// 공개 => open_ids_
		String[] del_ids_ = req.getParameterValues("del_id");			// 삭제 => del_ids_
		String[] list_ids_ = req.getParameter("ids").trim().split(" ");	// 전체 id => list_idd_
		String btn = req.getParameter("btn");							// 일괄 공개 or 일괄 삭제
		
		// btn이 "일괄 공개"라면
		if(btn.equals("일괄공개")) {
			List<String> oid;
			if(open_ids_ != null)					// 공개할 id들이 비어있지 않다면 
				oid = Arrays.asList(open_ids_);		// => oid 리스트에 open_ids_ 추가
			else									// 비어있다면
				oid = Arrays.asList();				// => oid 리스트에 빈 배열 생성
			
			// cid => 비공개해야할 id들 모음 // 일단 전체 id들을 넣어준다.
			List<String> cid = new ArrayList<>(Arrays.asList(list_ids_));
			// 그리고 전체 id들 중 공개할 id들을 제거해준다. => 비공개할 id 모음
			cid.removeAll(oid);
			
			// service.pubNoticeAll() 메소드에 공개할 id들과 비공개할 id들을 부여해서 일괄공개/비공개 실행
			int result = service.pubNoticeAll(oid, cid);
			
			System.out.println("데이터가 " + result + "개만큼 수정되었습니다."); 
		}
		// btn이 "일괄 삭제"이고 삭제할 id들이 비어있지 않다면 
		else if(btn.equals("일괄삭제") && del_ids_ != null) {
			// int형 배열에 del_ids_를 형변환하여 삽입함
			int[] del_ids = new int[del_ids_.length];
			for(int i = 0; i < del_ids_.length; i++)
				del_ids[i] = Integer.parseInt(del_ids_[i]);
			
			// service.removeNoticeAll() 메소드에 앞서만든 삭제할 id들을 넣어서 일괄 삭제 실행
			int result = service.removeNoticeAll(del_ids);
				
			System.out.println("데이터가 " + result + "개만큼 삭제되었습니다.");
		}
		
		// 글 목록으로 돌아감
		resp.sendRedirect("noticeList");
	}
}
