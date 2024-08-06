package dao;

import db.JdbcUtil;
import dto.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyPageDao {

    public UserDto select(String user_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = JdbcUtil.getCon();
            String sql = "select * from USER1 where USER_ID = ?";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            if (rs.next()) { // 한줄이 있으면
                UserDto dto = new UserDto();
                dto.setUserId(rs.getString("USER_ID"));
//                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                return dto;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            JdbcUtil.close(con, pstmt, rs);
        }
    }
}
