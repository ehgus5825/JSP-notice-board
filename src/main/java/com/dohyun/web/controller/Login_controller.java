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

@WebServlet("/login")
public class Login_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter writer = resp.getWriter();

		// session : 접속한 유저의 정보 => member
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("userMember");

		// 로그인 중 => alert 후 뒤로가기
		if (member != null) {
			writer.println("<script>alert('이미 로그인이 되어있습니다.'); history.back();</script>");
		}
		// 로그아웃 중 => login.jsp
		else {
			req.getRequestDispatcher("WEB-INF/view/member/login.jsp").forward(req, resp);
		}
		writer.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 예외처리된 form의 내용 
		String mid = req.getParameter("username");
		String pwd = req.getParameter("password");

		PrintWriter writer = resp.getWriter();

		// memberService 객체 생성
		MemberService service = new MemberService();
		
		// 회원 조회
		Member member = service.getMember(mid);

		// 아이디와 비밀번호가 일치하는지 체크
		if (member != null && mid.equals(member.getMid()) && pwd.equals(member.getPwd())) {
			// 세션에 조회된 회원 등록해줌 & 접속 시간 가능 시간 기본 1시간 설정
			HttpSession session = req.getSession();
			session.setAttribute("userMember", member);
			session.setMaxInactiveInterval(60 * 60);
			
			// alert 후 index.jsp 이동
			writer.println("<script>alert('로그인이 완료되었습니다.'); location.href='/index';</script>");
		}
		// 일치 X => alert 후 login.jsp 이동
		else {
			writer.println("<script>alert('아이디와 비밀번호를 확인해주세요.'); location.href='/login';</script>");
		}

		writer.close();
	}
}
