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


	// ȸ�� ���
	public int addMember(String id, String pwd, String name, String gender, String birthday, String phone, String email) {
		// ���� ������ ��� Member�� �����ϴ� ����
		Member member = new Member(id, pwd, name, gender, birthday, phone, email);

		// �����ε� ��ȣ��
		return addMember(member);
	}
	public int addMember(Member member) {
		// dao.insertMember()�� member�� �־ ����� �߰�
		int result = dao.insertMember(member);
		return result;
	}
	
// -- member/join->dupl -------------------------------------------------------------------------------------------------------------------------------------
	
	// ȸ�� �ߺ� Ȯ��
	public int duplMember(String id) {
		// dao.selectMemberCnt()�� id�� �־ �����ϴ� ȸ���� �� ��ȯ
		int result = dao.selectMemberCnt(id);
		return result;
	}
	
// -- member/login ------------------------------------------------------------------------------------------------------------------------------------------
	
	// ȸ�� ��ȸ
	public Member getMember(String id) {
		// dao.selectMember()�� id�� �־ id�� �����ϴ� Member�� ��ȯ
		Member member = dao.selectMember(id);
		return member;
	}
}
