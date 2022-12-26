package com.dohyun.web.controller;

import java.io.IOException;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/memberMyDetail")
public class MyDetail_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상세 조회할 게시글의 id를 받은 후 예외처리
		String nid_ = req.getParameter("id");
		int nid = (nid_==null)?1:(nid_=="")?1:Integer.parseInt(nid_); // 기본값 - nid : 1

		// 다음글과 이전글에 검색 필드와 검색 내용이 영향을 주기 때문에 받아옴 그리고 예외처리
		String field = req.getParameter("f");
		String query = req.getParameter("q");
		field = (field==null)?"title":(field=="")?"title":field; // 기본값 => "title"
		query = (query==null)?"":query;							 // 기본값 => ""
		
		// 접속한 유저의 글만 이전, 다음글에 두기 위한 Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// NoticeService 객체 생성
		NoticeService service = new NoticeService();
		
		// service.getNotice(nid)를 통해 상세 조회할 게시글의 내용을 받아옴
		Notice notice = service.getNotice(nid);

		// 상세 조회 글의 다음 글 / service.getNextMyNotice()에 mid를 추가적으로 넣어서 접속자의 글로만 추려서 다음글 추천
		Notice nextNotice = service.getNextMyNotice(nid, member.getMid(), field, query);
		// 상세 조회 글의 이전 글 / service.getPrevMyNotice()에 mid를 추가적으로 넣어서 접속자의 글로만 추려서 이전글 추천
		Notice prevNotice = service.getPrevMyNotice(nid, member.getMid(), field, query);
		
		// 출력
		req.setAttribute("n", notice);
		req.setAttribute("nextN", nextNotice);
		req.setAttribute("pervN", prevNotice);		
		// 공지사항 상세 조회로 넘어감 . => myDetail.jsp
		req.getRequestDispatcher("/WEB-INF/view/member/myDetail.jsp").forward(req, resp);
	}
}
