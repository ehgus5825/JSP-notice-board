package com.dohyun.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.dohyun.web.entity.Member;
import com.dohyun.web.service.MemberService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/memberLogin")
public class Login_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter writer = resp.getWriter();

		// 접속한 유저가 로그인 되어있는지 확인하기 위한 Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// 이미 로그인이 되어 있다면 alert 후 뒤로가기
		if(member != null) {
			writer.println("<script>alert('이미 로그인이 되어있습니다.'); history.back();</script>");
		}
		// 로그인이 되어 있지 않다면 로그인 화면으로 넘어감 => login.jsp
		else {
			req.getRequestDispatcher("WEB-INF/view/member/login.jsp").forward(req, resp);
		}
		writer.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 form으로부터 값을 받아옴. (신뢰있는 값) 
		String mid = req.getParameter("username");
		String pwd = req.getParameter("password");
		
		PrintWriter writer = resp.getWriter();
		
		// memberService 객체 생성
		MemberService service = new MemberService();
		// service.getMember() 메소드에 id를 넣어서 id에 해당하는 member 객체를 받아옴
		Member member = service.getMember(mid);
		
		// id에 매핑되는 값이 있다면
		if(member != null) {
			// id에 매핑이 후 값이 일치한다면 로그인 
			if(mid.equals(member.getMid()) && pwd.equals(member.getPwd())){
				// Session을 만들고 member을 session으로 등록해줌
				HttpSession session = req.getSession();
				session.setAttribute("userMember", member);
				// Session의 시간을 1시간으로 결정
				session.setMaxInactiveInterval(60*60);
				// alert 후 홈 화면으로 돌아감
				writer.println("<script>alert('로그인이 완료되었습니다.'); location.href='/index';</script>");
			}
			// id에 매핑은 되지만 값이 다르다면 alert 후 다시 로그인으로 돌아감
			else {
				writer.println("<script>alert('아이디와 비밀번호를 확인해주세요.'); location.href='/memberLogin';</script>");
			}
		}
		// id에 매핑되는 값이 없다면 alert 후 다시 로그인으로 돌아감
		else {
			writer.println("<script>alert('아이디와 비밀번호를 확인해주세요.'); location.href='/memberLogin';</script>");
		}
		writer.close();
	}
}
