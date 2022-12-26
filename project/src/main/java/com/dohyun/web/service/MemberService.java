package com.dohyun.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.dohyun.web.dao.MemberDAO;
import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.entity.NoticeView;

public class MemberService {
	MemberDAO dao = new MemberDAO();
	
// -- member/join->confirm ----------------------------------------------------------------------------------------------------------------------------------


	// 회원 등록
	public int addMember(String id, String pwd, String name, String gender, String birthday, String phone, String email) {
		// 여러 값들을 모아 Member로 변경하는 과정
		Member member = new Member(id, pwd, name, gender, birthday, phone, email);

		// 오버로딩 재호출
		return addMember(member);
	}
	public int addMember(Member member) {
		// dao.insertMember()에 member를 넣어서 멤버를 추가
		int result = dao.insertMember(member);
		return result;
	}
	
// -- member/join->dupl -------------------------------------------------------------------------------------------------------------------------------------
	
	// 회원 중복 확인
	public int duplMember(String id) {
		// dao.selectMemberCnt()에 id를 넣어서 존재하는 회원의 수 반환
		int result = dao.selectMemberCnt(id);
		return result;
	}
	
// -- member/login ------------------------------------------------------------------------------------------------------------------------------------------
	
	// 회원 조회
	public Member getMember(String id) {
		// dao.selectMember()에 id를 넣어서 id에 부합하는 Member을 반환
		Member member = dao.selectMember(id);
		return member;
	}
}
