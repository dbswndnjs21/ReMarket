package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.JdbcUtil;
import dto.FileDto;

public class FileDao {
	
	public int insert(FileDto fto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			
			String sql = "insert into file1 values(file_id.nextval,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fto.getProductId());
			pstmt.setString(2, fto.getFileName());
			pstmt.setString(3, fto.getSaveFileName());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
		
	}
	
	public int editFile(FileDto fto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtil.getCon();
			
			 String sql = "UPDATE file1 SET "
		                + "file_name = ?, "
		                + "save_file_name = ? "
		                + "WHERE product_id = ?";
			 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fto.getFileName());
			pstmt.setString(2, fto.getSaveFileName());
			pstmt.setInt(3, fto.getProductId());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
		
		
	}
}
