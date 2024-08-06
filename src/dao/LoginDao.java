package dao;

import db.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

    public boolean isMember(String user_id, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getCon();
            String sql = "select * from user1 where user_id = ? and password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        } finally {
            JdbcUtil.close(conn,pstmt,rs);
        }

    }
}
