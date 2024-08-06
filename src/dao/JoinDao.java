package dao;

import db.JdbcUtil;
import dto.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JoinDao {

    public int join(UserDto dto) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = JdbcUtil.getCon();
            String sql = "insert into user1 values (user_pcode.nextval, ?, ?, ?,?,?,?, sysdate, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getUserId());
            pstmt.setString(2, dto.getPassword());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getEmail());
            pstmt.setString(5, dto.getPhone());
            pstmt.setString(6, dto.getAddr());
            pstmt.setInt(7, dto.getGrade());
            pstmt.setString(8, dto.getBirth());

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return -1;
        }
        finally {
            JdbcUtil.close(con, pstmt, null);
        }
    }

    public boolean checkUserID(String user_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean exists = false;
        try {
            conn = JdbcUtil.getCon();
            String sql = "SELECT COUNT(*) FROM user1 WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                exists = count > 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            JdbcUtil.close(conn,pstmt,rs);
        }

        return exists;
    }



}
