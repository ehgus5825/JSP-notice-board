package com.dohyun.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dohyun.web.entity.Member;

public class MemberDAO {
	// 공통적으로 재사용하는 리소스들
	private static Connection con;
	private static PreparedStatement st;
	private static ResultSet rs;

	// DB에 접속해서 Connection 리소스를 받아오는 과정
	public static Connection getConnect() {
		String url = "jdbc:mysql://notice_db:3306/notice_board?serverTimezone=UTC";
		String uid = "notice_user";
		String pwd = "qwe123";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, uid, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// 사용했던 리소스를 닫음
	public static void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원 등록 (Δ)
	public int insertMember(Member member) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = "INSERT INTO MEMBER (mid, pwd, name, gender, birthday, phone, email) "
					+ "VALUES (?,?,?,?,?,?,?)";

			// 전달 받은 값들을 "?"에 매핑시켜서 Member 테이블에 한 행을 삽입함

			st = con.prepareStatement(sql);
			st.setString(1, member.getMid());
			st.setString(2, member.getPwd());
			st.setString(3, member.getName());
			st.setString(4, member.getGender());
			st.setString(5, member.getBirthday());
			st.setString(6, member.getPhone());
			st.setString(7, member.getEmail());
			result = st.executeUpdate();

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 회원 중복 확인 (Δ)
	public int selectMemberCnt(String mid) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = "SELECT COUNT(MID) CNT FROM MEMBER WHERE MID = ?";

			// Member 테이블에서 mid가 동일한 행의 개수를 받아옴

			st = con.prepareStatement(sql);
			st.setString(1, mid);
			rs = st.executeQuery();

			if (rs.next()) {
				result = rs.getInt("CNT");
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원 조회 (Δ)
	public Member selectMember(String mid) {

		Member member = null;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = "SELECT * FROM MEMBER WHERE MID = ?";

			// Member 테이블에서 mid가 동일한 행을 조회

			st = con.prepareStatement(sql);
			st.setString(1, mid);
			rs = st.executeQuery();

			if (rs.next()) {
				Member m = new Member();
				m.setMid(rs.getString("MID"));
				m.setPwd(rs.getString("PWD"));
				m.setName(rs.getString("NAME"));
				m.setGender(rs.getString("GENDER"));
				m.setBirthday(rs.getString("BIRTHDAY"));
				m.setPhone(rs.getString("PHONE"));
				m.setEmail(rs.getString("EMAIL"));
				m.setRole(rs.getString("ROLE"));
				member = m;
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
}
