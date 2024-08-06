package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import db.JdbcUtil;
import dto.BlameDto;

public class BlameDao {

	// 1. 신고등록 게시물을 저장 
	public int insert(BlameDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getCon();

			// 1-1. user1 테이블 -> user_id에 해당하는 pcode 조회
			String selectPcode = "select pcode from user1 where user_id = ?";
			pstmt = conn.prepareStatement(selectPcode);
			pstmt.setString(1, dto.getpCode());
			rs = pstmt.executeQuery();

			int pcode = 0;
			if(rs.next()) {
				pcode = Integer.parseInt(rs.getString("pcode"));
			} else {
				System.out.println(pcode);
				System.out.println("pcode 값이 없음.");
				return -1;
			}

			// 1-2. 1에서 찾은 pcode를 활용해서 게시글 저장
			String sql = "insert into blame (blameId, pCode, blameTitle, blameCategory, blameContent, status, createdAt) "
	                   + "values (blame_seq.nextval, ?, ?, ?, ?, 1, sysdate)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, pcode);
	        pstmt.setString(2, dto.getBlameTitle());
	        pstmt.setString(3, dto.getBlameCategory());
	        pstmt.setString(4, dto.getBlameContent());
			
			return pstmt.executeUpdate(); // 정상적으로 데이터가 들어갔다면 1 반환
		} catch (SQLException e) {
			System.out.println("[에러]" + e.getMessage());
			return -1;
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

	}

	// 2. 전체 신고 조회
	public ArrayList<BlameDto> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BlameDto> lists;
		try {
			conn = JdbcUtil.getCon();

			// blame 테이블과 user1 테이블 조인 -> user1테이블에 name 값 가져오기 위함. 
			String sql = "select b.blameId, b.pCode, b.blameTitle, b.blameCategory, b.blameContent, b.createdAt, b.status, "
					+ "u.name from blame b join user1 u on b.pCode = u.pcode "
					+ "where b.status = 1 "
					+ "ORDER BY b.createdAt DESC"; // 최신에 작성한 게시글이 가장 위에 오게 표시. 정렬하지 않을 경우, 순서가 랜덤처럼 보임. 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			lists = new ArrayList<BlameDto>();
			while(rs.next()) {
				int blameId = rs.getInt("blameId");
				String pCode = rs.getString("pCode");
				String blameTitle = rs.getString("blameTitle");
				String blameCategory = rs.getString("blameCategory");
				String blameContent = rs.getString("blameContent");
				Timestamp createdAt = rs.getTimestamp("createdAt");
				int status = rs.getInt("status");
				String userName = rs.getString("userName");
				BlameDto dto = new BlameDto(blameId, pCode, blameTitle, blameCategory, blameContent, createdAt, status, userName);
				lists.add(dto);
			}
			return lists;
		} catch (SQLException e) {
			System.out.println("[에러]" + e.getMessage());
			return null;
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

	// 3. id 값을 활용해서 특정 게시물 1개 가져오기(viewBlameController에서 활용-> viewBlame.jsp)
	public BlameDto selectById(int blameId) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BlameDto dto = null;
		try {
			conn = JdbcUtil.getCon();

			// 3-2. 게시글 정보 조회 로직
			String sql = "SELECT b.blameId, b.pCode, b.blameTitle, b.maleCategory, b.blameContent, b.createdAt, b.status, u.name " 
					+ "FROM blame b JOIN user1 u ON b.pCode = u.pcode WHERE b.blameId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, blameId);
			rs = pstmt.executeQuery();


			if(rs.next()) {
				String pCode = rs.getString("pCode");
				String blameTitle = rs.getString("blameTitle");
				String blameCategory = rs.getString("blameCategory");
				String blameContent = rs.getString("blameContent");
				Timestamp createdAt = rs.getTimestamp("createdAt");
				int status = rs.getInt("status");
				String userName = rs.getString("userName");
				dto = new BlameDto(blameId, pCode, blameTitle, blameCategory, blameContent, createdAt, status, userName);
			}

		} catch (SQLException e) {
			System.out.println("[에러] " + e.getMessage());
		} 
		finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return dto;
	}
	// 4. 게시판 페이지 처리 
	// 4-1. 게시판 총 개수(status가 1)
	public int getTotalPostCount() {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		int count = 0;

		try {
			conn = JdbcUtil.getCon();
			String sql = "select count(*) from blame where status = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 개수를 세는 sql문이라 한 행만 출력될 예정.
			if(rs.next()) {
				// ResultSet은 1부터 인덱스 시작(0 아님).
					count = rs.getInt(1); 
					// 행의 첫 번째 열의 값을 count에 담기. 
					// ex) 개수가 50이면 50을 count에 담음.
				}
		} catch (SQLException e) {
			System.out.println("[에러]: " + e.getMessage());
		}

		return count;

	}
	
	// 4-2. 페이징 처리 된 게시글 조회(게시글 10개 당 페이지 1)
	public ArrayList<BlameDto> selectAll(int startIndex, int postsPerPage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println(startIndex + ",,,," +postsPerPage);
		ArrayList<BlameDto> lists = new ArrayList<>();
		try {
			conn = JdbcUtil.getCon();

			String sql = "SELECT * FROM ( "
	                   + "    SELECT ROWNUM rnum, c.* FROM ( "
	                   + "        SELECT b.*, u.name FROM blame b "
	                   + "        JOIN user1 u ON b.pCode = u.pcode "
	                   + "        where b.status = 1 "
	                   + "        ORDER BY b.createdAt DESC "
	                   + "    ) c "
	                   + "    WHERE ROWNUM <= ? "
	                   + ") WHERE rnum > ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndex + postsPerPage); // rownum의 최대값
			pstmt.setInt(2, startIndex);
			
			rs = pstmt.executeQuery();
			
			 while(rs.next()) {
		            BlameDto dto = new BlameDto(
		                rs.getInt("blameId"),
		                rs.getString("pCode"),
		                rs.getString("blameTitle"),
		                rs.getString("blameCategory"),
		                rs.getString("blameContent"),
		                rs.getTimestamp("createdAt"),
		                rs.getInt("status"),
		                rs.getString("Name")
		            );
		            System.out.println(  rs.getInt("blameId"));
		            System.out.println(    rs.getString("Name"));
		        	
		            lists.add(dto);
		        }
			return lists;
		} catch (SQLException e) {
			System.out.println("[에러]" + e.getMessage());
			return new ArrayList<>(); // 빈 리스트를 반환
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// 5. 신고글 검색 기능 (제목, 내용, 작성자별)
	public ArrayList<BlameDto> searchPosts(String condition, String keyword) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getCon();
			String sql = "select b.*, u.name from blame b join user1 u on b.pCode = u.pcode where b.status = 1 and "; 
			// 선택 필드마다 테이블이 다름. 
			switch (condition) {
			case "blameTitle": 
				sql += "b.blameTitle Like ? order by createdAt desc";
				break;
				
			case "blameContent": 
				sql += "b.blameContent Like ? order by createdAt desc";
				break;
				
			case "name": 
				sql += "u.name Like ? order by createdAt desc";
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + condition);
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			ArrayList<BlameDto> lists = new ArrayList<>();
			while(rs.next()) {
				BlameDto dto = new BlameDto(
				rs.getInt("blameId"),
				rs.getString("pCode"),
				rs.getString("blameTitle"),
				rs.getString("blameCategory"),
				rs.getString("blameContent"),
				rs.getTimestamp("createdAt"),
				rs.getInt("status"),
				rs.getString("name")
				);
				
				lists.add(dto);
			}
			return lists;
		} catch (SQLException e) {
			System.out.println("[에러] 게시글 검색 불가 : " +e.getMessage());
			return new ArrayList<>(); // 빈 리스트를 반환
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// 6. 신고글 처리 및 삭제 (status를 0으로 변경하기, update 쿼리 사용) 
		public void deleteBlame(int blameId) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = JdbcUtil.getCon();
				String sql = "update blame set status = 0 where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, blameId);
				 pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	// 7. 알림 전송 메서드
		public void sendNotification(String userName, String message) {
	        // 알림 전송 로직 구현 예정
	    }

}
