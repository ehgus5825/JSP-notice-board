package com.dohyun.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

import com.dohyun.web.entity.Notice;

public class NoticeDAO {
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

	// 목록 조회
	public List<Notice> selectList(String field, String query, int page, String orderFlag, boolean pubFlag, String mid) {

		List<Notice> list = new ArrayList<>();

		try {
			con = getConnect(); // con 리소스를 받아옴

			// Notice에서 입력한 검색 필드, 검색어에 부합
			String sql = "SELECT * FROM NOTICE WHERE NOTICE." + field + " LIKE ?";

			// mid에 값이 존재하면 작성자가 한명으로 제한
			if (mid != null && !mid.equals("")) {
				sql += " AND WRITER_ID = ?";
			} else {
				// pubFlag가 true이면 공개 or false이면 비공개
				if (pubFlag == true) {
					sql += " AND PUB = 1";
				}
			}

			// 최신 등록순 or 인기순으로 정렬
			sql += " ORDER BY " + orderFlag + " DESC limit ? OFFSET ?";
			
			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");

			// mid에 값이 존재하면 (page-1)*5 의 다음 행에서부터 5개의 행만 조회 / 0, 5, 10, 15, 20 ...
			if (mid != null && !mid.equals("")) {
				st.setString(2, mid);
				st.setInt(3, 5);
				st.setInt(4, (page - 1) * 5);
			}
			// mid에 값이 존재하면 (page-1)*10 의 다음 행에서부터 10개의 행만 조회 / 0, 10, 20, 30 ...
			else {
				st.setInt(2, 10);
				st.setInt(3, (page - 1) * 10);
			}

			rs = st.executeQuery();

			while (rs.next()) {
				int nid = rs.getInt("NID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				LocalDateTime regDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				int hit = rs.getInt("HIT");
				String files = rs.getString("FILES");
				int pub = rs.getInt("PUB");

				Notice n = new Notice(nid, title, writerId, content, regDateTime, hit, files, pub);

				list.add(n);
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 글 개수 조회
	public int selectNoticeCnt(String field, String query, boolean pubFlag, String mid) {

		int count = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			// Notice 테이블에서 입력한 검색필드와 검색어에 부합
			String sql = "SELECT COUNT(nid) COUNT FROM NOTICE WHERE " + field + " Like ?";

			// mid에 값이 존재하면 작성자가 한명으로 제한
			if (mid != null && !mid.equals("")) {
				sql += " AND WRITER_ID = ?";
			} else {
				// pubFlag가 true이면 공개 or false이면 비공개
				if (pubFlag == true) {
					sql += " AND PUB = 1";
				}
			}

			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");

			if (mid != null && !mid.equals("")) {
				st.setString(2, mid);
			}

			rs = st.executeQuery();

			if (rs.next()) {
				count = rs.getInt("COUNT");
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// 다음 글 조회 --------------
	public Notice selectNextNotice(int nid_, String field, String query, boolean pubFlag, String mid) {

		Notice n = new Notice();

		try {
			con = getConnect(); // con 리소스를 받아옴

			// Notice 테이블에서 입력한 검색필드, 검색어, 작성자, 공개 or 비공개 조건에 부합하면서
			// 등록순서가 과거순으로 정렬하여 나타난 조회결과에서
			// 해당 nid보다 등록일자 최신인 것 중 가장 첫번째 행을 조회

			String sql = "SELECT * FROM NOTICE WHERE NID = ( SELECT N.NID FROM ( SELECT * FROM NOTICE WHERE " + field
					+ " LIKE ? ";

			// mid에 값이 존재하면 작성자가 한명으로 제한
			if (mid != null && !mid.equals("")) {
				sql += " AND WRITER_ID = ?";
			} else {
				// pubFlag가 true이면 공개 or false이면 비공개
				if (pubFlag == true) {
					sql += " AND PUB = 1";
				}
			}

			sql += " ORDER BY REGDATE ) N WHERE REGDATE > ( SELECT REGDATE FROM NOTICE WHERE NID = ? ) LIMIT 1 )";

			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");

			if (mid != null && !mid.equals("")) {
				st.setString(2, mid);
				st.setInt(3, nid_);
			} else {
				st.setInt(2, nid_);
			}

			rs = st.executeQuery();

			if (rs.next()) {
				int nid = rs.getInt("NID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				LocalDateTime regDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				int hit = rs.getInt("HIT");
				String files = rs.getString("FILES");
				int pub = rs.getInt("PUB");

				n = new Notice(nid, title, writerId, content, regDateTime, hit, files, pub);
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n;
	}

	// 이전 글 조회 --------------
	public Notice selectPrevNotice(int nid_, String field, String query, boolean pubFlag, String mid) {

		Notice n = new Notice();

		try {
			con = getConnect(); // con 리소스를 받아옴

			// Notice 테이블에서 입력한 검색필드, 검색어, 작성자, 공개 or 비공개 조건에 부합하면서
			// 등록순서가 최신순으로 정렬하여 나타난 조회결과에서
			// 해당 nid보다 등록일자가 과거인 것 중 가장 첫번째 행을 조회

			String sql = "SELECT * FROM NOTICE WHERE NID = ( SELECT N.nid FROM ( SELECT * FROM NOTICE WHERE " + field
					+ " LIKE ?";

			// mid에 값이 존재하면 작성자가 한명으로 제한
			if (mid != null && !mid.equals("")) {
				sql += " AND WRITER_ID = ?";
			} else {
				// pubFlag가 true이면 공개 or false이면 비공개
				if (pubFlag == true) {
					sql += " AND PUB = 1";
				}
			}

			sql += " ORDER BY REGDATE DESC, nid desc ) N WHERE REGDATE < ( SELECT REGDATE FROM NOTICE WHERE NID = ? ) LIMIT 1)";

			st = con.prepareStatement(sql);
			st.setString(1, "%" + query + "%");

			if (mid != null && !mid.equals("")) {
				st.setString(2, mid);
				st.setInt(3, nid_);
			} else {
				st.setInt(2, nid_);
			}

			rs = st.executeQuery();

			if (rs.next()) {
				int nid = rs.getInt("NID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				LocalDateTime regDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				int hit = rs.getInt("HIT");
				String files = rs.getString("FILES");
				int pub = rs.getInt("PUB");

				n = new Notice(nid, title, writerId, content, regDateTime, hit, files, pub);
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 미리보기 목록 조회
	public List<Notice> selectPreviewList(boolean pubFlag, String orderFlag) {
		List<Notice> list = new ArrayList<>();

		try {
			con = getConnect(); // con 리소스를 받아옴

			// Notice 테이블에서 공개 or 비공개 조건을 주고
			// 최신 등록일순 or 조회순으로 정렬한 조회 결과에서
			// 처음부터 5개 행을 조회

			String sql = "SELECT * FROM NOTICE";

			if (pubFlag == true) {
				sql += " WHERE PUB = 1";
			}

			sql += " ORDER BY " + orderFlag + " DESC LIMIT 5";

			st = con.prepareStatement(sql);
			rs = st.executeQuery();

			while (rs.next()) {
				int nid = rs.getInt("NID");
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				LocalDateTime regDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				int hit = rs.getInt("HIT");
				String files = rs.getString("FILES");
				int pub = rs.getInt("PUB");

				Notice n = new Notice(nid, title, writerId, content, regDateTime, hit, files, pub);

				list.add(n);
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 일괄 공개 요청 (Δ)
	public int updatePubAll(String oidsCVS, String cidsCVS) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql1 = String.format("UPDATE NOTICE SET PUB = 1 WHERE nid IN (%s)", oidsCVS);

			// Notice 테이블에서 %s에 부합하는 nid의 행의 pub을 모두 1으로 변경 (공개로 변경)

			String sql2 = String.format("UPDATE NOTICE SET PUB = 0 WHERE nid IN (%s)", cidsCVS);

			// Notice 테이블에서 %s에 부합하는 nid의 행의 pub을 모두 0으로 변경 (비공개로 변경)

			if (!oidsCVS.equals("")) {
				st = con.prepareStatement(sql1);
				result += st.executeUpdate();
			}

			if (!cidsCVS.equals("")) {
				st = con.prepareStatement(sql2);
				result += st.executeUpdate();
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 일괄 삭제 요청 (Δ)
	public int deleteNoticeAll(String dids_CVS) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = String.format("DELETE FROM NOTICE WHERE NID IN (%s)", dids_CVS);

			// Notice 테이블에서 %s에 속하는 nid의 행을 모두 삭제
			// ex) %s == "1,2,3,4,5"

			st = con.prepareStatement(sql);
			result = st.executeUpdate();

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 등록 요청 (Δ)
	public int insertNotice(Notice notice) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = "INSERT INTO NOTICE (title, writer_id, content, FILES, PUB) VALUES (?,?,?,?,?)";

			// Notice 테이블의 컬럼에 전달받은 값을 ?에 매핑시켜 하나의 행을 삽입

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

	// 상세 조회 (Δ)
	public Notice selectNotice(int nid) {

		Notice n = new Notice();

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql1 = "UPDATE NOTICE SET HIT = HIT+1 WHERE NID=?";

			// Notice 테이블에서 nid에 부합하는 행의 hit를 1 올림 (조회수 +1)

			String sql2 = "SELECT * FROM NOTICE WHERE NID=?";

			// Notice 테이블에서 nid에 부합하는 행을 조회

			st = con.prepareStatement(sql1);
			st.setInt(1, nid);
			st.executeUpdate();

			st = con.prepareStatement(sql2);
			st.setInt(1, nid);
			rs = st.executeQuery();

			if (rs.next()) {
				String title = rs.getString("TITLE");
				String writerId = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				LocalDateTime regDateTime = rs.getTimestamp("REGDATE").toLocalDateTime();
				int hit = rs.getInt("HIT");
				String files = rs.getString("FILES");
				int pub = rs.getInt("PUB");

				n = new Notice(nid, title, writerId, content, regDateTime, hit, files, pub);
			}

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 글 삭제 요청 (Δ)
	public int deleteNotice(int nid) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = "DELETE FROM NOTICE WHERE NID = ?";

			// Notice 테이블에서 nid가 일치하는 행을 삭제

			st = con.prepareStatement(sql);
			st.setInt(1, nid);
			result = st.executeUpdate();

			dbClose(); // 리소스를 닫기
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 수정 요청 (Δ)
	public int updateNotice(Notice notice) {

		int result = 0;

		try {
			con = getConnect(); // con 리소스를 받아옴

			String sql = "UPDATE NOTICE SET title = ?, content = ?, files = ?, pub = ? WHERE NID = ?";

			// Notice 테이블에서 nid가 일치하는 행의 title, content, files, pub을 수정함

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
}