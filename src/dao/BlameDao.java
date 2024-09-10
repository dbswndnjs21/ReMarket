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
        int pcode = 0;
        int product_id = 0;
        try {
            conn = JdbcUtil.getCon();

         //    1-1. product 테이블 -> user_id에 해당하는 product_id 조회
//            String sellerSql = "select blameUser from product where product_id = ?";
//            try (PreparedStatement pstmt1 = conn.prepareStatement(sellerSql)) {
//                pstmt1.setInt(1, dto.getProduct_id());
//                try (ResultSet rs1 = pstmt1.executeQuery()) {
//                    if (rs1.next()) {
//                    	//product_id = rs1.getInt(product_id);
//                    	dto.setBlameUser(rs1.getString("blameUser"));
//                    } else {
//                        System.out.println(product_id);
//                        System.out.println("product_id 값이 없음.");
//                        return -1;
//                    }
//                }
//            }

            // 1-2. user1 테이블 -> user_id에 해당하는 pcode 조회
            String selectPcode = "select pcode from user1 where user_id = ?";
            try (PreparedStatement pstmt2 = conn.prepareStatement(selectPcode)) {
                pstmt2.setString(1, dto.getpCode());
                System.out.println("dto.getpCode:" + dto.getpCode());
                try (ResultSet rs2 = pstmt2.executeQuery()) {
                    if (rs2.next()) {
                        pcode = rs2.getInt("pcode");
                        System.out.println("pCode :" + pcode);
                    } else {
                        System.out.println(pcode);
                        System.out.println("pcode 값이 없음.");
                        return -1;
                    }
                }
            }
            System.out.println("dto : " + dto);
            // 1-3. 1-1에서 찾은 product_id, 1-2에서 찾은 pcode를 활용해서 게시글 저장
            String sql = "insert into blame (blameId, pCode, blameTitle, blameCategory, blameContent, status, createdAt, product_id, blameUser) "
                       + "values (blame_seq.nextval, ?, ?, ?, ?, 1, sysdate, ?, ?)";
            try (PreparedStatement pstmt3 = conn.prepareStatement(sql)) {
                pstmt3.setInt(1, pcode);
                pstmt3.setString(2, dto.getBlameTitle());
                pstmt3.setString(3, dto.getBlameCategory());
                pstmt3.setString(4, dto.getBlameContent());
                pstmt3.setInt(5, dto.getProduct_id());
                pstmt3.setString(6, dto.getBlameUser());

                return pstmt3.executeUpdate(); // 정상적으로 데이터가 들어갔다면 1 반환
            }
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
 
			String sql = "select b.blameId, b.pCode, b.blameTitle, b.blameCategory, b.blameContent, "
			           + "b.createdAt, b.status, b.blameUser, b.product_id ,u.name, p.product_name "
			           + "from blame b "
			           + "join user1 u on b.pCode = u.pcode "
			           + "join product p on b.product_id = p.product_id "
			           + "where b.status = 1 "
			           + "ORDER BY b.createdAt ASC"; // 가장 오래된 신고글부터 순차적으로 처리해야 하므로 맨 위로 올라오게 함.
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
				String blameUser = rs.getString("blameUser");
				int product_id = rs.getInt("product_id");
				String userName = rs.getString("name");
				String product_name = rs.getString("product_name");
				
				BlameDto dto = new BlameDto(blameId, pCode, blameTitle, blameCategory, blameContent, createdAt, status, blameUser, userName, product_name, product_id);
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
			String sql =  "select b.blameId, b.pCode, b.blameTitle, b.blameCategory, b.blameContent, b.createdAt, b.status, b.blameUser, b.product_id, u.name as userName, p.product_name "
	                + "from blame b "
	                + "join user1 u on b.pCode = u.pcode "
	                + "join product p on b.product_id = p.product_id "
	                + "where b.blameId = ?";
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
				String blameUser = rs.getString("blameUser");
				String userName = rs.getString("userName");
				String product_name = rs.getString("product_name");
				int product_id = rs.getInt("product_id");
				
				
				dto = new BlameDto(blameId, pCode, blameTitle, blameCategory, blameContent, createdAt, status, blameUser, userName, product_name, product_id);
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
	                   + "        SELECT b.*, u.name, p.product_name FROM blame b "
	                   + "        JOIN user1 u ON b.pCode = u.pcode "
	                   + "		  join product p on b.product_id = p.product_id "
	                   + "        where b.status = 1 "
	                   + "        ORDER BY b.createdAt ASC "
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
		                rs.getString("Name"),
		                rs.getString("blameUser"),
		                rs.getString("product_name"),
		                rs.getInt("product_id")
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
		                rs.getString("Name"),
		                rs.getString("blameUser"),
		                rs.getString("product_name"),
		                rs.getInt("product_id")
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
	
	// 6. 신고글 처리완료(status를 0으로 변경하기, update 쿼리 사용) 
		public void completeBlame(int blameId) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = JdbcUtil.getCon();
				String sql = "update blame set status = 0 where blameId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, blameId);
				 pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		}
		
	// 9. 신고글 처리거부	
		public void refuseBlame(int blameId) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = JdbcUtil.getCon();
				String sql = "update blame set status = 2 where blameId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, blameId);
				 pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		}
	// 8. 알림 전송 메서드
		public void sendNotification(String userName, String message) {
	        // 알림 전송 로직 구현 예정
	    }

}
