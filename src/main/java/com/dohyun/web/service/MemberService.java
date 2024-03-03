package com.dohyun.web.service;

import com.dohyun.web.dao.MemberDAO;
import com.dohyun.web.entity.Member;

public class MemberService {
	
	MemberDAO dao = new MemberDAO();

	// 회원 등록
	public int addMember(String id, String pwd, String name, String gender, String birthday, String phone,
			String email) {
		
		Member member = new Member(id, pwd, name, gender, birthday, phone, email);

		return dao.insertMember(member);
	}

	// 회원 중복 확인
	public int duplMember(String id) {
		
		return dao.selectMemberCnt(id);
	}

	// 회원 조회
	public Member getMember(String id) {
	
		return dao.selectMember(id);
	}
}
