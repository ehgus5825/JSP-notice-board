package com.dohyun.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dohyun.web.entity.Member;

public class MemberDAO {
	// ���������� �����ϴ� ���ҽ��� 
	private static Connection con;
	private static PreparedStatement st;
	private static ResultSet rs;
	
	// DB�� �����ؼ� Connection ���ҽ��� �޾ƿ��� ����
	public static Connection getConnect() {
		String url = "jdbc:oracle:thin:@localhost:1521/xepdb1";
		String uid = "DOHYUN"; 
		String pwd = "ASD123";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, uid, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// ����ߴ� ���ҽ��� ����
	public static void dbClose() {
		try {
			if(rs != null)
				rs.close();
			if(st != null)
				st.close();
			if(con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

// -- member/join->confirm ----------------------------------------------------------------------------------------------------------------------------------
	
	// ȸ�� ���
	public int insertMember(Member member) {
		int result = 0;
		  
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "INSERT INTO member (id, pwd, name, gender, birthday, phone, emall ) VALUES (?,?,?,?,?,?,?)";
			// Member ���̺��� ���� ���� ������ "?"�� ���ν��Ѽ� �� ���� ������
			st = con.prepareStatement(sql);
		    st.setString(1, member.getMid());
		    st.setString(2, member.getPwd());
		    st.setString(3, member.getName());
		    st.setString(4, member.getGender());
		    st.setString(5, member.getBirthday());
		    st.setString(6, member.getPhone());
		    st.setString(7, member.getEmail());
		    result = st.executeUpdate();
		   		   
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
// -- member/join->dupl -------------------------------------------------------------------------------------------------------------------------------------	
	
	// ȸ�� �ߺ� Ȯ��
	public int selectMemberCnt(String id) {
		int result = 0;
		
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT COUNT(ID) CNT FROM MEMBER WHERE ID = ?";
			// Member ���̺��� id�� ���޹��� id�� ������ ���� ������ �޾ƿ�
			st = con.prepareStatement(sql);
			st.setString(1, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	result = rs.getInt("CNT");
		    }

		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

// -- member/login ------------------------------------------------------------------------------------------------------------------------------------------

	// ȸ�� ��ȸ
	public Member selectMember(String id) {
		Member member = null;
		
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM MEMBER WHERE ID = ?";
			// Member ���̺��� id�� ���޹��� id�� ������ ���� �޾ƿ�
			st = con.prepareStatement(sql);
			st.setString(1, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	Member m = new Member();
		    	m.setMid(rs.getString("ID"));
		    	m.setPwd(rs.getString("PWD"));
		    	m.setName(rs.getString("NAME"));
		    	m.setGender(rs.getString("GENDER"));
		    	m.setBirthday(rs.getString("BIRTHDAY"));
		    	m.setPhone(rs.getString("PHONE"));
		    	m.setEmail(rs.getString("EMALL"));
		    	m.setRole(rs.getString("ROLE"));
		    	member = m;
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
}
