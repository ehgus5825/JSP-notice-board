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
	// 공통적으로 재사용하는 리소스들
	private static Connection con;
	private static PreparedStatement st;
	private static ResultSet rs;
	
	// DB에 접속해서 Connection 리소스를 받아오는 과정
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
	
	// 사용했던 리소스를 닫음
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

	// 관리자 목록
	public List<NoticeView> selectAdminList(String field, String query, int page){
		List<NoticeView> list = new ArrayList<>();
		
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM ("
	    			+ " 	SELECT row_number() over (ORDER BY REGDATE DESC) NUM,"
	    			+ " 	NOTICE_VIEW.* FROM NOTICE_VIEW WHERE NOTICE_VIEW." + field + " LIKE ? "
	    			+ ") "
	    			+ "WHERE NUM BETWEEN ? AND ?";
			// NoticeView에서 검색필드, 검색어 조건에 맞으며 등록순서가 최신순으로 정렬되어 넘버링한 조회결과에서
			// 1+(page-1)*10 에서 page*10 범위의 행만 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list; 
	}

	// 기본 목록
	public List<NoticeView> selectList(String field, String query, int page){
	    List<NoticeView> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM ("
	    			+ " 	SELECT row_number() over (ORDER BY REGDATE DESC) NUM,"
	    			+ " 	NOTICE_VIEW.* FROM NOTICE_VIEW WHERE NOTICE_VIEW." + field + " LIKE ? AND PUB = 1 "
	    			+ ") "
	    			+ "WHERE NUM BETWEEN ? AND ?";
			// NoticeView에서 공개되었으며 검색필드, 검색어 조건에 맞으며 등록순서가 최신순으로 정렬되어 넘버링한 조회결과에서
			// 1+(page-1)*10 에서 page*10 범위의 행만 조회 
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}

	// 관리자 글 개수
	public int selectNoticeAdminCnt(String field, String query) {
		int count = 0;
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT COUNT(ID) COUNT FROM NOTICE WHERE " + field + " Like ?";
			// Notice 테이블에서 검색필드, 검색어 조건에 부합하는 행들의 개수를 반환
			
		    st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("COUNT");
		    }
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	// 글 개수
	public int selectNoticeCnt(String field, String query) {
	    int count = 0;
		
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT COUNT(ID) COUNT FROM NOTICE WHERE " + field + " Like ? AND PUB = 1";
			// Notice 테이블에서 공개되었으며 검색필드, 검색어 조건에 부합하는 행들의 개수를 반환
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("COUNT");
		    }
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	// 일괄공개 요청 
	public int updatePubAll(String oidsCVS, String cidsCVS) {
		int result = 0;
			
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql1 = String.format("UPDATE NOTICE SET PUB = 1 WHERE id IN (%s)", oidsCVS);
			// Notice 테이블에서 id가 %s에 부합한다면 해당 행의 pub을 1으로 변경 (공개로 변경) 
			
			String sql2 = String.format("UPDATE NOTICE SET PUB = 0 WHERE id IN (%s)", cidsCVS);
			// Notice 테이블에서 id가 %s에 부합한다면 해당 행의 pub을 0으로 변경 (비공개로 변경)
			
			if(!oidsCVS.equals("")) {				
				st = con.prepareStatement(sql1);
				result += st.executeUpdate();
			}
			
			if(!cidsCVS.equals("")) {
				st = con.prepareStatement(sql2);
				result += st.executeUpdate();
			}
		   		   
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    return result;
	}

	// 일괄삭제 요청
	public int deleteNoticeAll(String dids_CVS) {
		int result = 0;
		  
	    try {
	    	con = getConnect(); // con 리소스를 받아옴
	    	String sql = String.format("DELETE NOTICE WHERE ID IN ( %s )", dids_CVS);
			// Notice 테이블에서 id가 %s에 부합한다면 해당 행을 삭제  
	    	
			st = con.prepareStatement(sql);
		    result = st.executeUpdate();
		   		   
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    return result;
	}

/// -- notice/reg -----------------------------------------------------------------------------------------------------------------------------------	
	
	// 글 등록 요청 
	public int insertNotice(Notice notice) {
		int result = 0;

	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "INSERT INTO notice (title, writer_id, content, FILES, PUB) VALUES (?, ?,?,?,?)";
			// Notice 테이블의 "?"에 해당하는 값을 전달받은 값으로 매핑시켜 한 행을 삽입
			
			st = con.prepareStatement(sql);
		    st.setString(1, notice.getTitle());
		    st.setString(2, notice.getWriterId());
		    st.setString(3, notice.getContent());
		    st.setString(4, notice.getFiles());
		    st.setInt(5, notice.getPub());	
			result = st.executeUpdate();
		   		   
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return result;
	}

/// -- notice/detail --------------------------------------------------------------------------------------------------------------------------------
	
	// 상세조회
	public Notice selectNotice(int id) {
		Notice n = new Notice();
		
	    try {
		    con = getConnect(); // con 리소스를 받아옴
			String sql1 = "UPDATE NOTICE SET HIT = HIT+1 WHERE ID=?";
			// Notice 테이블에서 id에 부합하는 행의 hit를 1 올림 (조회수 +1) 
			String sql2 = "SELECT * FROM NOTICE WHERE ID=?";
			// Notice 테이블에서 id에 부합하는 행을 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return n;
	}

	// 관리자 다음글 조회
	public Notice selectNextAdminNotice(int id, String field, String query) {
		Notice n = new Notice();
	
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM NOTICE " + 
				      "WHERE ID = (" +
				      "  SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? ORDER BY REGDATE)" +
				      "  WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				      "AND ROWNUM = 1 )";
			// Notice 테이블에서 검색필드, 검색어 조건이 맞으면서 등록순서가 과거순으로 정렬하여 나타난 조회결과에서 
			// 해당 id보다 등록일자 최신인 것 중 가장 첫번째 행을 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  return n;
	}
	
	// 관리자 이전글 조회
	public Notice selectPrevAdminNotice(int id, String field, String query) {
		Notice n = new Notice();
		
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM NOTICE " + 
					  "WHERE ID = ( " +
					  "   SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? ORDER BY REGDATE DESC) " +
					  "   WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) AND ROWNUM = 1 " +
					  ")"; 
			// Notice 테이블에서 검색필드, 검색어 조건이 맞으면서 등록순서가 최신순으로 정렬하여 나타난 조회결과에서 
			// 해당 id보다 등록일자가 과거인 것 중 가장 첫번째 행을 조회 
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	// 다음글 조회
	public Notice selectNextNotice(int id, String field, String query) {
		Notice n = new Notice();
		
   	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM NOTICE " + 
				      "WHERE ID = (" +
				      "  SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND PUB = 1 ORDER BY REGDATE)" +
				      "  WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				      "AND ROWNUM = 1 )";
			// Notice 테이블에서 공개되어 있으며 검색필드, 검색어 조건이 맞으면서 등록순서가 과거순으로 정렬하여 나타난 조회결과에서 
			// 해당 id보다 등록일자 최신인 것 중 가장 첫번째 행을 조회 
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
   	    return n;
	}
	
	// 이전글 조회
	public Notice selectPrevNotice(int id, String field, String query) {
		Notice n = new Notice();
	
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM NOTICE " + 
					  "WHERE ID = ( " +
					  "   SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND PUB = 1 ORDER BY REGDATE DESC) " +
					  "   WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) AND ROWNUM = 1 " +
					  ")"; 
			// Notice 테이블에서 공개되어 있으며 검색필드, 검색어 조건이 맞으면서 등록순서가 최신순으로 정렬하여 나타난 조회결과에서 
			// 해당 id보다 등록일자가 과거인 것 중 가장 첫번째 행을 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
/// -- notice/delete --------------------------------------------------------------------------------------------------------------------------------	

	// 글 삭제 요청 	
	public int deleteNotice(int id) {
		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "DELETE NOTICE WHERE ID =?";
			// Notice 테이블에서 id가 일치하는 행을 삭제
			
			st = con.prepareStatement(sql);
		    st.setInt(1, id);
			result = st.executeUpdate();
		   		   
			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
/// -- notice/update --------------------------------------------------------------------------------------------------------------------------------
	
	// 글 수정 요청
	public int updateNotice(Notice notice) {
		int result = 0;
		
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "UPDATE notice SET title = ?, content = ?, files = ?, pub = ? WHERE id = ?";
			// Notice 테이블에서 id가 일치하는 행의 title, content, files, pub을 수정함
			
			st = con.prepareStatement(sql);
		    st.setString(1, notice.getTitle());
		    st.setString(2, notice.getContent());
		    st.setString(3, notice.getFiles());
		    st.setInt(4, notice.getPub());
		    st.setInt(5, notice.getNid());
			result = st.executeUpdate();
		   		   
			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
    	return result;
	}
	
/// -- index ----------------------------------------------------------------------------------------------------------------------------------------	
	
	// 관리자 최신 글 요청 
	public List<Notice> selectAdminNewestList(){
	    List<Notice> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM (SELECT row_number() over (ORDER BY REGDATE DESC) NUM, NOTICE.* FROM NOTICE) "
						+ "WHERE NUM BETWEEN 1 AND 5";
			// Notice 테이블에서 검색필드, 검색어, 작성자 조건에 맞으며 등록순서가 최신순으로 정렬되어 넘버링한 조회결과에서
			// 1에서 5 범위의 행만 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}
	
	// 최신 글 요청 
	public List<Notice> selectNewestList(){
	    List<Notice> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM (SELECT row_number() over (ORDER BY REGDATE DESC) NUM, NOTICE.* FROM NOTICE WHERE PUB = 1) "
	    			+ "WHERE NUM BETWEEN 1 AND 5";
			// Notice 테이블에서 공개되어 있고 검색필드, 검색어, 작성자 조건에 맞으며 등록순서가 최신순으로 정렬되어 넘버링한 조회결과에서
			// 1에서 5 범위의 행만 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}

/// -- member/myPage ----------------------------------------------------------------------------------------------------------------------------------------

	// 내 글 목록
	public List<NoticeView> selectMyList(String field, String query, int page, String mid){		
	    List<NoticeView> list = new ArrayList<>();
	    
	    try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM ("
	    			+ " 	SELECT row_number() over (ORDER BY REGDATE DESC) NUM,"
	    			+ " 	NOTICE_VIEW.* FROM NOTICE_VIEW WHERE NOTICE_VIEW." + field + " LIKE ? AND WRITER_ID = ?"
	    			+ ") WHERE NUM BETWEEN ? AND ?";
			// NoticeView에서 검색필드, 검색어, 작성자 조건에 맞으며 등록순서가 최신순으로 정렬되어 넘버링한 조회결과에서
			// 1+(page-1)*5 에서 page*5 범위의 행만 조회
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	    return list;
	}

	// 내 글수
	public int selectMyNoticeCnt(String field, String query, String mid) {
	    int count = 0;
		
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT COUNT(ID) COUNT FROM NOTICE WHERE " + field + " Like ? AND WRITER_ID = ?";
			// Notice 테이블에서 검색필드, 검색어, 작성자 조건이 맞는 행들의 수를 반환
			
			st = con.prepareStatement(sql);
		    st.setString(1, "%" + query + "%");
		    st.setString(2, mid);
		    rs = st.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("COUNT");
		    }
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 다음 내 글 조회
	public Notice selectNextMyNotice(int id, String mid, String field, String query) {	
		Notice n = new Notice();
	
		try {
			con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM NOTICE " + 
				      "WHERE ID = (" +
				      "  SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND WRITER_ID = ? ORDER BY REGDATE)" +
				      "  WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID = ?) " + 
				      "AND ROWNUM = 1 )"; 
			// Notice 테이블에서 검색필드, 검색어, 작성자 조건이 맞으면서 등록순서가 과거순으로 정렬하여 나타난 조회결과에서 
			// 해당 id보다 등록일자 최신인 것 중 가장 첫번째 행을 조회

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
	  
			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	// 이전 내 글 조회
	public Notice selectPrevMyNotice(int id, String mid, String field, String query) {
		Notice n = new Notice();
		
	  	try {
	  		con = getConnect(); // con 리소스를 받아옴
			String sql = "SELECT * FROM NOTICE " + 
					  "WHERE ID = ( " +
					  "   SELECT ID FROM (SELECT * FROM NOTICE WHERE " + field + " LIKE ? AND WRITER_ID = ? ORDER BY REGDATE DESC) " +
					  "   WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID = ?) AND ROWNUM = 1 " +
					  ")"; 
			// Notice 테이블에서 검색필드, 검색어, 작성자 조건이 맞으면서 등록순서가 최신순으로 정렬하여 나타난 조회결과에서 
			// 해당 id보다 등록일자가 과거인 것 중 가장 첫번째 행을 조회   
			
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
		    
		    dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	  	return n;
	}
}