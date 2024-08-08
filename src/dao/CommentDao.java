package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import db.JdbcUtil;
import dto.CommentDto;

public class CommentDao {
	// 1. 댓글 등록 -> 동명이인의 pcode를 가져오게 되어서 계속 에러가 발생함.
	public int insertComment(HttpServletRequest request, CommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getCon();
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user_id");
			
			// 1-1. pcode 받아오기 
			String selectPcode = "select pcode from user1 where user_id = ?";
			pstmt = conn.prepareStatement(selectPcode);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			int pcode = 0;
			if(rs.next()) {
				pcode = rs.getInt("pcode");
			} else {
				System.out.println(pcode);
				System.out.println("pcodeId 값이 없음.");
			}

			// 1-2. pcode를 활용해서 댓글 저장하기.
			String sql = "insert into comment1 values(comment1_seq.nextval, ?, ?, ?, sysdate, null, 1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardId());
			pstmt.setInt(2, pcode);
			pstmt.setString(3, dto.getContent());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] 댓글 등록 실패: " + e.getMessage()); 
			 return -1;
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// 2. 게시글 고유 id에 해당하는 모든 댓글 조회
	public ArrayList<CommentDto> selectByBoardId(int boardId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcUtil.getCon();
			String sql = "select c.*, u.name from comment1 c join user1 u on c.userId = u.pcode where boardId = ? and status = 1 order by createdAt Asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();
			
			ArrayList<CommentDto> commentList = new ArrayList<>();
			while(rs.next()) {
				CommentDto dto = new CommentDto(
				rs.getInt("id"), 
				rs.getInt("boardId"),
				rs.getString("userId"),
				rs.getString("content"),
				rs.getTimestamp("createdAt"),
				rs.getTimestamp("updatedAt"),
				rs.getInt("status"),
				rs.getString("name"));
				commentList.add(dto);
			}
			return commentList;
		} catch (SQLException e) {
			System.out.println("[에러] 게시글 id에 해당하는 댓글을 불러올 수 없습니다. " + e.getMessage());
			return new ArrayList<CommentDto>();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	// 3. 댓글 삭제 / status 값 0으로 변경
	public int deleteComment(int commentId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JdbcUtil.getCon();
			String sql ="update comment1 set status = 0 where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] 댓글 삭제 실패: " + e.getMessage());
			return -1;
		} finally {
			 JdbcUtil.close(conn, pstmt, null);
		}
	}
	
	// 4. 댓글 수정 
	public void updateComment(int commentId, String commentContent) {
		Connection conn = null;
		PreparedStatement pstmt = null; 
		
		try {
			conn = JdbcUtil.getCon();
			String sql ="update comment1 set content = ?, updatedAt = sysdate where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentContent);
			pstmt.setInt(2, commentId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러] 댓글 수정 불가: " + e.getMessage());
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		
		
	}
	
	
	
}
