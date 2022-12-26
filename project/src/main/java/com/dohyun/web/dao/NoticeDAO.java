package com.dohyun.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dohyun.web.entity.Notice;
import com.dohyun.web.entity.NoticeView;

public class NoticeDAO {
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

/// -- notice/list ----------------------------------------------------------------------------------------------------------------------------------

	// ������ ���
	public List<NoticeView> selectAdminList(String field, String query, int page){
		List<NoticeView> list = new ArrayList<>();
		
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM ("
	    			+ " 	SELECT row_number() over (ORDER BY REGDATE DESC) NUM,"
	    			+ " 	NOTICE_VIEW.* FROM NOTICE_VIEW WHERE NOTICE_VIEW." + field + " LIKE ? "
	    			+ ") "
	    			+ "WHERE NUM BETWEEN ? AND ?";
			// NoticeView���� �˻��ʵ�, �˻��� ���ǿ� ������ ��ϼ����� �ֽż����� ���ĵǾ� �ѹ����� ��ȸ�������
			// 1+(page-1)*10 ���� page*10 ������ �ุ ��ȸ
			
			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");
			st.setInt(2, 1+(page-1)*10);
			st.setInt(3, page*10);
			rs = st.executeQuery();

		    while(rs.next()) {
		        int id = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
		        int cmtCount = rs.getInt("COUNT");

		        NoticeView n = new NoticeView(
			        		id,
					        title,
					        writerId,
					        regDate,
					        hit,
					        files,
					        pub,
					        cmtCount );
		        
		        list.add(n);
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list; 
	}

	// �⺻ ���
	public List<NoticeView> selectList(String field, String query, int page){
	    List<NoticeView> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM ("
	    			+ " 	SELECT row_number() over (ORDER BY REGDATE DESC) NUM,"
	    			+ " 	NOTICE_VIEW.* FROM NOTICE_VIEW WHERE NOTICE_VIEW." + field + " LIKE ? AND PUB = 1 "
	    			+ ") "
	    			+ "WHERE NUM BETWEEN ? AND ?";
			// NoticeView���� �����Ǿ����� �˻��ʵ�, �˻��� ���ǿ� ������ ��ϼ����� �ֽż����� ���ĵǾ� �ѹ����� ��ȸ�������
			// 1+(page-1)*10 ���� page*10 ������ �ุ ��ȸ 
			
			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");
			st.setInt(2, 1+(page-1)*10);
			st.setInt(3, page*10);
		    rs = st.executeQuery();
	
		    while(rs.next()) {
		        int id = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
		        int cmtCount = rs.getInt("COUNT");
	
		        NoticeView n = new NoticeView(
			        		id,
					        title,
					        writerId,
					        regDate,
					        hit,
					        files,
					        pub,
					        cmtCount );
		        
		        list.add(n);
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}

	// ������ �� ����
	public int selectNoticeAdminCnt(String field, String query) {
		int count = 0;
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT COUNT(ID) COUNT FROM NOTICE WHERE " + field + " Like ?";
			// Notice ���̺��� �˻��ʵ�, �˻��� ���ǿ� �����ϴ� ����� ������ ��ȯ
			
		    st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("COUNT");
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	// �� ����
	public int selectNoticeCnt(String field, String query) {
	    int count = 0;
		
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT COUNT(ID) COUNT FROM NOTICE WHERE " + field + " Like ? AND PUB = 1";
			// Notice ���̺��� �����Ǿ����� �˻��ʵ�, �˻��� ���ǿ� �����ϴ� ����� ������ ��ȯ
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("COUNT");
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	// �ϰ����� ��û 
	public int updatePubAll(String oidsCVS, String cidsCVS) {
		int result = 0;
			
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql1 = String.format("UPDATE NOTICE SET PUB = 1 WHERE id IN (%s)", oidsCVS);
			// Notice ���̺��� id�� %s�� �����Ѵٸ� �ش� ���� pub�� 1���� ���� (������ ����) 
			
			String sql2 = String.format("UPDATE NOTICE SET PUB = 0 WHERE id IN (%s)", cidsCVS);
			// Notice ���̺��� id�� %s�� �����Ѵٸ� �ش� ���� pub�� 0���� ���� (������� ����)
			
			if(!oidsCVS.equals("")) {				
				st = con.prepareStatement(sql1);
				result += st.executeUpdate();
			}
			
			if(!cidsCVS.equals("")) {
				st = con.prepareStatement(sql2);
				result += st.executeUpdate();
			}
		   		   
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    return result;
	}

	// �ϰ����� ��û
	public int deleteNoticeAll(String dids_CVS) {
		int result = 0;
		  
	    try {
	    	con = getConnect(); // con ���ҽ��� �޾ƿ�
	    	String sql = String.format("DELETE NOTICE WHERE ID IN ( %s )", dids_CVS);
			// Notice ���̺��� id�� %s�� �����Ѵٸ� �ش� ���� ����  
	    	
			st = con.prepareStatement(sql);
		    result = st.executeUpdate();
		   		   
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    return result;
	}

/// -- notice/reg -----------------------------------------------------------------------------------------------------------------------------------	
	
	// �� ��� ��û 
	public int insertNotice(Notice notice) {
		int result = 0;

	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "INSERT INTO notice (title, writer_id, content, FILES, PUB) VALUES (?, ?,?,?,?)";
			// Notice ���̺��� "?"�� �ش��ϴ� ���� ���޹��� ������ ���ν��� �� ���� ����
			
			st = con.prepareStatement(sql);
		    st.setString(1, notice.getTitle());
		    st.setString(2, notice.getWriterId());
		    st.setString(3, notice.getContent());
		    st.setString(4, notice.getFiles());
		    st.setInt(5, notice.getPub());	
			result = st.executeUpdate();
		   		   
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return result;
	}

/// -- notice/detail --------------------------------------------------------------------------------------------------------------------------------
	
	// ����ȸ
	public Notice selectNotice(int id) {
		Notice n = new Notice();
		
	    try {
		    con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql1 = "UPDATE NOTICE SET HIT = HIT+1 WHERE ID=?";
			// Notice ���̺��� id�� �����ϴ� ���� hit�� 1 �ø� (��ȸ�� +1) 
			String sql2 = "SELECT * FROM NOTICE WHERE ID=?";
			// Notice ���̺��� id�� �����ϴ� ���� ��ȸ
			
			st = con.prepareStatement(sql1);
			st.setInt(1, id);
		    st.executeUpdate();
			
			st = con.prepareStatement(sql2);
		    st.setInt(1, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");

		        n = new Notice(
			        		id,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub    );
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return n;
	}

	// ������ ������ ��ȸ
	public Notice selectNextAdminNotice(int id, String field, String query) {
		Notice n = new Notice();
	
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM NOTICE " + 
				      "WHERE ID = (" +
				      "  SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? ORDER BY REGDATE)" +
				      "  WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				      "AND ROWNUM = 1 )";
			// Notice ���̺��� �˻��ʵ�, �˻��� ������ �����鼭 ��ϼ����� ���ż����� �����Ͽ� ��Ÿ�� ��ȸ������� 
			// �ش� id���� ������� �ֽ��� �� �� ���� ù��° ���� ��ȸ
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setInt(2, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	int nid = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
	
		        n = new Notice(
			        		nid,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub  );
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  return n;
	}
	
	// ������ ������ ��ȸ
	public Notice selectPrevAdminNotice(int id, String field, String query) {
		Notice n = new Notice();
		
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM NOTICE " + 
					  "WHERE ID = ( " +
					  "   SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? ORDER BY REGDATE DESC) " +
					  "   WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) AND ROWNUM = 1 " +
					  ")"; 
			// Notice ���̺��� �˻��ʵ�, �˻��� ������ �����鼭 ��ϼ����� �ֽż����� �����Ͽ� ��Ÿ�� ��ȸ������� 
			// �ش� id���� ������ڰ� ������ �� �� ���� ù��° ���� ��ȸ 
			
		    st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setInt(2, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	int nid = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
		        
		        n = new Notice(
			        		nid,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub  );
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	// ������ ��ȸ
	public Notice selectNextNotice(int id, String field, String query) {
		Notice n = new Notice();
		
   	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM NOTICE " + 
				      "WHERE ID = (" +
				      "  SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND PUB = 1 ORDER BY REGDATE)" +
				      "  WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				      "AND ROWNUM = 1 )";
			// Notice ���̺��� �����Ǿ� ������ �˻��ʵ�, �˻��� ������ �����鼭 ��ϼ����� ���ż����� �����Ͽ� ��Ÿ�� ��ȸ������� 
			// �ش� id���� ������� �ֽ��� �� �� ���� ù��° ���� ��ȸ 
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setInt(2, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	int nid = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
	
		        n = new Notice(
			        		nid,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub    );
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
   	    return n;
	}
	
	// ������ ��ȸ
	public Notice selectPrevNotice(int id, String field, String query) {
		Notice n = new Notice();
	
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM NOTICE " + 
					  "WHERE ID = ( " +
					  "   SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND PUB = 1 ORDER BY REGDATE DESC) " +
					  "   WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) AND ROWNUM = 1 " +
					  ")"; 
			// Notice ���̺��� �����Ǿ� ������ �˻��ʵ�, �˻��� ������ �����鼭 ��ϼ����� �ֽż����� �����Ͽ� ��Ÿ�� ��ȸ������� 
			// �ش� id���� ������ڰ� ������ �� �� ���� ù��° ���� ��ȸ
			
		    st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setInt(2, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	int nid = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
		        
		        n = new Notice(
			        		nid,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub  );
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
/// -- notice/delete --------------------------------------------------------------------------------------------------------------------------------	

	// �� ���� ��û 	
	public int deleteNotice(int id) {
		int result = 0;

		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "DELETE NOTICE WHERE ID =?";
			// Notice ���̺��� id�� ��ġ�ϴ� ���� ����
			
			st = con.prepareStatement(sql);
		    st.setInt(1, id);
			result = st.executeUpdate();
		   		   
			dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
/// -- notice/update --------------------------------------------------------------------------------------------------------------------------------
	
	// �� ���� ��û
	public int updateNotice(Notice notice) {
		int result = 0;
		
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "UPDATE notice SET title = ?, content = ?, files = ?, pub = ? WHERE id = ?";
			// Notice ���̺��� id�� ��ġ�ϴ� ���� title, content, files, pub�� ������
			
			st = con.prepareStatement(sql);
		    st.setString(1, notice.getTitle());
		    st.setString(2, notice.getContent());
		    st.setString(3, notice.getFiles());
		    st.setInt(4, notice.getPub());
		    st.setInt(5, notice.getNid());
			result = st.executeUpdate();
		   		   
			dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
    	return result;
	}
	
/// -- index ----------------------------------------------------------------------------------------------------------------------------------------	
	
	// ������ �ֽ� �� ��û 
	public List<Notice> selectAdminNewestList(){
	    List<Notice> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM (SELECT row_number() over (ORDER BY REGDATE DESC) NUM, NOTICE.* FROM NOTICE) "
						+ "WHERE NUM BETWEEN 1 AND 5";
			// Notice ���̺��� �˻��ʵ�, �˻���, �ۼ��� ���ǿ� ������ ��ϼ����� �ֽż����� ���ĵǾ� �ѹ����� ��ȸ�������
			// 1���� 5 ������ �ุ ��ȸ
			
			st = con.prepareStatement(sql);
		    rs = st.executeQuery();
	
		    while(rs.next()) {
		        int id = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
	
		        Notice n = new Notice(
			        		id,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub	  );
		        
		        list.add(n);
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}
	
	// �ֽ� �� ��û 
	public List<Notice> selectNewestList(){
	    List<Notice> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM (SELECT row_number() over (ORDER BY REGDATE DESC) NUM, NOTICE.* FROM NOTICE WHERE PUB = 1) "
	    			+ "WHERE NUM BETWEEN 1 AND 5";
			// Notice ���̺��� �����Ǿ� �ְ� �˻��ʵ�, �˻���, �ۼ��� ���ǿ� ������ ��ϼ����� �ֽż����� ���ĵǾ� �ѹ����� ��ȸ�������
			// 1���� 5 ������ �ุ ��ȸ
			
			st = con.prepareStatement(sql);
		    rs = st.executeQuery();
	
		    while(rs.next()) {
		        int id = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
	
		        Notice n = new Notice(
			        		id,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub   );
		        
		        list.add(n);
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}

/// -- member/myPage ----------------------------------------------------------------------------------------------------------------------------------------

	// �� �� ���
	public List<NoticeView> selectMyList(String field, String query, int page, String mid){		
	    List<NoticeView> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM ("
	    			+ " 	SELECT row_number() over (ORDER BY REGDATE DESC) NUM,"
	    			+ " 	NOTICE_VIEW.* FROM NOTICE_VIEW WHERE NOTICE_VIEW." + field + " LIKE ? AND WRITER_ID = ?"
	    			+ ") WHERE NUM BETWEEN ? AND ?";
			// NoticeView���� �˻��ʵ�, �˻���, �ۼ��� ���ǿ� ������ ��ϼ����� �ֽż����� ���ĵǾ� �ѹ����� ��ȸ�������
			// 1+(page-1)*5 ���� page*5 ������ �ุ ��ȸ
			
			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");
			st.setString(2, mid);
			st.setInt(3, 1+(page-1)*5);
			st.setInt(4, page*5);
			
		    rs = st.executeQuery();

		    while(rs.next()) {
		        int id = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
		        int cmtCount = rs.getInt("COUNT");

		        NoticeView n = new NoticeView(
			        		id,
					        title,
					        writerId,
					        regDate,
					        hit,
					        files,
					        pub,
					        cmtCount  );
		        
		        list.add(n);
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}

	// �� �ۼ�
	public int selectMyNoticeCnt(String field, String query, String mid) {
	    int count = 0;
		
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT COUNT(ID) COUNT FROM NOTICE WHERE " + field + " Like ? AND WRITER_ID = ?";
			// Notice ���̺��� �˻��ʵ�, �˻���, �ۼ��� ������ �´� ����� ���� ��ȯ
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setString(2, mid);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("COUNT");
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// ���� �� �� ��ȸ
	public Notice selectNextMyNotice(int id, String mid, String field, String query) {	
		Notice n = new Notice();
	
		try {
			con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM NOTICE " + 
				      "WHERE ID = (" +
				      "  SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND WRITER_ID = ? ORDER BY REGDATE)" +
				      "  WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				      "AND ROWNUM = 1 )"; 
			// Notice ���̺��� �˻��ʵ�, �˻���, �ۼ��� ������ �����鼭 ��ϼ����� ���ż����� �����Ͽ� ��Ÿ�� ��ȸ������� 
			// �ش� id���� ������� �ֽ��� �� �� ���� ù��° ���� ��ȸ

			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");
			st.setString(2, mid);
			st.setInt(3, id);
			rs = st.executeQuery();
	  
			if(rs.next()) {
				int nid = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				Date regDate = rs.getDate("REGDATE");
				int hit = rs.getInt("HIT");
				String files = rs.getString("FILES");
				int pub = rs.getInt("PUB");
	
				n = new Notice(
						nid,
						title,
						writerId,
						content,
						regDate,
						hit,
						files,
						pub    );
			}
	  
			dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	// ���� �� �� ��ȸ
	public Notice selectPrevMyNotice(int id, String mid, String field, String query) {
		Notice n = new Notice();
		
	  	try {
	  		con = getConnect(); // con ���ҽ��� �޾ƿ�
			String sql = "SELECT * FROM NOTICE " + 
					  "WHERE ID = ( " +
					  "   SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND WRITER_ID = ? ORDER BY REGDATE DESC) " +
					  "   WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) AND ROWNUM = 1 " +
					  ")"; 
			// Notice ���̺��� �˻��ʵ�, �˻���, �ۼ��� ������ �����鼭 ��ϼ����� �ֽż����� �����Ͽ� ��Ÿ�� ��ȸ������� 
			// �ش� id���� ������ڰ� ������ �� �� ���� ù��° ���� ��ȸ   
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setString(2, mid);
		    st.setInt(3, id);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	int nid = rs.getInt("ID");
		        String title = rs.getString("TITLE");
		        String writerId = rs.getString("WRITER_ID");
		        String content = rs.getString("CONTENT");
		        Date regDate = rs.getDate("REGDATE");
		        int hit = rs.getInt("HIT");
		        String files = rs.getString("FILES");
		        int pub = rs.getInt("PUB");
		        
		        n = new Notice(
			        		nid,
					        title,
					        writerId,
					        content,
					        regDate,
					        hit,
					        files,
					        pub   );
		    }
		    
		    dbClose(); // ���ҽ��� �ݱ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  	return n;
	}
}