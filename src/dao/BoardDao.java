package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import db.JdbcUtil;
import dto.BoardDto;

public class BoardDao {

	// 1. 게시글 저장 
	public int insert(BoardDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getCon();

			// 1-1. user1 테이블 -> user_id에 해당하는 pcode 조회
			String selectPcode = "select pcode from user1 where user_id = ?";
			pstmt = conn.prepareStatement(selectPcode);
			pstmt.setString(1, dto.getUserId());
			rs = pstmt.executeQuery();

			int pcode = 0;
			if(rs.next()) {
				pcode = rs.getInt("pcode");
			} else {
				System.out.println(pcode);
				System.out.println("pcodeId 값이 없음.");
			}

			// 1-2. 1에서 찾은 pcode를 활용해서 게시글 저장
			String sql = "insert into board values(board_seq.nextval, ?, ?, ?, 0, sysdate, null, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pcode);
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			return pstmt.executeUpdate(); // 정상적으로 데이터가 들어갔다면 1 반환
		} catch (SQLException e) {
			System.out.println("[에러]" + e.getMessage());
			return -1;
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

	}

	// 2. 전체 게시글 조회, 현재 사용하지 않음, 필요할 경우 사용
	public ArrayList<BoardDto> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardDto> lists;
		try {
			conn = JdbcUtil.getCon();

			// board 테이블과 user1 테이블 조인 -> user1테이블에 name 값 가져오기 위함. 
			String sql = "select b.id, b.userId, b.title, b.content, b.hit, b.createdAt, b.updatedAt, b.status, "
					+ "u.name from board b join user1 u on b.userId = u.pcode "
					+ "where b.status = 1 "
					+ "ORDER BY b.createdAt DESC"; // 최신에 작성한 게시글이 가장 위에 오게 표시. 정렬하지 않을 경우, 순서가 랜덤처럼 보임. 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			lists = new ArrayList<BoardDto>();
			while(rs.next()) {
				int id = rs.getInt("id");
				String userId = rs.getString("userId");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				Timestamp createdAt = rs.getTimestamp("createdAt");
				Timestamp updatedAt = rs.getTimestamp("updatedAt");
				int status = rs.getInt("status");
				String userName = rs.getString("name");
				BoardDto dto = new BoardDto(id, userId, title, content, hit, createdAt, updatedAt, status, userName);
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

	// 3. id 값을 활용해서 특정 게시물 1개 가져오기(viewBoardController에서 활용-> viewBoard.jsp), 조회수 증가 로직 포함
	public BoardDto selectById(int id) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto dto = null;
		try {
			conn = JdbcUtil.getCon();

			// 3-1. 조회수 증가 로직
			String incrementHitSql = "UPDATE board SET hit = hit + 1 WHERE id = ?";
			pstmt = conn.prepareStatement(incrementHitSql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

			// 3-2. 게시글 정보 조회 로직
			String sql = "SELECT b.id, b.userId, b.title, b.content, b.hit, b.createdAt, b.updatedAt, b.status, u.name " 
					+ "FROM board b JOIN user1 u ON b.userId = u.pcode WHERE b.id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();


			if(rs.next()) {
				String userId = rs.getString("userId");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				Timestamp createdAt = rs.getTimestamp("createdAt");
				Timestamp updatedAt = rs.getTimestamp("updatedAt");
				int status = rs.getInt("status");
				String name = rs.getString("name");
				dto = new BoardDto(id, userId, title, content, hit, createdAt, updatedAt, status, name);
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
			String sql = "select count(*) from board where status = 1";
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
	public ArrayList<BoardDto> selectAll(int startIndex, int postsPerPage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<BoardDto> lists = new ArrayList<>();
		try {
			conn = JdbcUtil.getCon();

			// board 테이블과 user1 테이블 조인 -> user1테이블에 name 값 가져오기 위함. 
			String sql = "SELECT * FROM ( "
	                   + "    SELECT ROWNUM rnum, c.* FROM ( "
	                   + "        SELECT b.*, u.name FROM board b "
	                   + "        JOIN user1 u ON b.userId = u.pcode "
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
				int id = rs.getInt("id");
				String userId = rs.getString("userId");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hit = rs.getInt("hit");
				Timestamp createdAt = rs.getTimestamp("createdAt");
				Timestamp updatedAt = rs.getTimestamp("updatedAt");
				int status = rs.getInt("status");
				String userName = rs.getString("name");
				BoardDto dto = new BoardDto(id, userId, title, content, hit, createdAt, updatedAt, status, userName);
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

	// 5. 게시글 수정 (editBoard)
	public void updateBoard(int id, String title, String content) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		
		try {
			conn = JdbcUtil.getCon();
			String sql = "update board set title = ?, content = ?, updatedAt = sysdate where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] 게시글 수정 실패: " + e.getMessage());
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}
	
	// 6. 게시글 검색 게시글 모두 조회, 페이징 처리 포함 (제목, 내용, 작성자별)
	public ArrayList<BoardDto> searchPosts(String condition, String keyword, int startIndex, int postsPerPage) {
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getCon();
			String sql = "SELECT * FROM (SELECT ROWNUM rnum, c.* FROM (SELECT b.*, u.name FROM board b JOIN user1 u ON b.userId = u.pcode WHERE b.status = 1 AND "; 
			// 선택 필드마다 테이블이 다름. 
			switch (condition) {
			case "title": 
				sql += "b.title LIKE ? ";
				break;
				
			case "content": 
				sql += "b.content Like ? ";
				break;
				
			case "name": 
				sql += "u.name Like ? ";
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + condition);
			}
			
			sql += "ORDER BY b.createdAt DESC) c WHERE ROWNUM <= ?) WHERE rnum > ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startIndex + postsPerPage);
			pstmt.setInt(3, startIndex);
			rs = pstmt.executeQuery();
			ArrayList<BoardDto> lists = new ArrayList<>();
			while(rs.next()) {
				BoardDto dto = new BoardDto(
				rs.getInt("id"),
				rs.getString("userId"),
				rs.getString("title"),
				rs.getString("content"),
				rs.getInt("hit"),
				rs.getTimestamp("createdAt"),
				rs.getTimestamp("updatedAt"),
				rs.getInt("status"),
				rs.getString("name")
				);
				
				lists.add(dto);
			}
			return lists;
		} catch (SQLException e) {
			System.out.println("[에러] 게시글 검색 불가 : " +e.getMessage());
			return new ArrayList<BoardDto>(); // null 대신 빈 리스트를 반환하는 것이 null 체크를 안해서 더 좋을 수 있음.
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// 7. 검색 결과의 총 게시글 수(6과 함께 사용, 페이징 처리에 필요한 메서드)
	public int getTotalSearchCount(String condition, String keyword) {
		Connection conn = null; 
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int totalPosts = 0;
		
	    try {
			conn = JdbcUtil.getCon();
			String sql = "SELECT COUNT(*) FROM board b JOIN user1 u ON b.userId = u.pcode WHERE b.status = 1 AND ";
			switch (condition) {
			case "title": 
			    sql += "b.title LIKE ? ";
			    break;
			case "content": 
			    sql += "b.content LIKE ? ";
			    break;
			case "name": 
			    sql += "u.name LIKE ? ";
			    break;
			default:
			    throw new IllegalArgumentException("Unexpected value: " + condition);
				}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalPosts =rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러] 총 검색 게시글 수 검색 불가 : " + e.getMessage());
		} finally {
	        JdbcUtil.close(conn, pstmt, rs);
	    }
		return totalPosts;
	}	
	
	// 8. 게시글 삭제 (status를 0으로 변경하기, update 쿼리 사용) 
		public void deleteBoard(int id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = JdbcUtil.getCon();
				String sql = "update board set status = 0 where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}

}
