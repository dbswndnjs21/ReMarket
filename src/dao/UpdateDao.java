package dao;

import db.JdbcUtil;
import dto.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateDao {

    public int update(UserDto dto) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = JdbcUtil.getCon();
            String sql = "update user1 set password = ?, name = ?, birth = ?, phone = ?, email = ?, addr = ? where user_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getPassword());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getBirth());
            pstmt.setString(4, dto.getPhone());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getAddr());
            pstmt.setString(7, dto.getUserId());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            return -1;
        }
        finally {
            JdbcUtil.close(con, pstmt, null);
        }
    }

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
                dto.setBirth(rs.getString("birth"));
                dto.setPhone(rs.getString("phone"));
                dto.setEmail(rs.getString("email"));
                dto.setAddr(rs.getString("addr"));
                dto.setJoinDate(rs.getDate("join_date"));
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
