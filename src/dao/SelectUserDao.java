package dao;

import db.JdbcUtil;
import dto.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SelectUserDao {
	// 특정 유저 조회
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
                dto.setpCode(rs.getString("pcode"));
                dto.setUserId(rs.getString("USER_ID"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setAddr(rs.getString("addr"));
                dto.setJoinDate(rs.getDate("join_date"));
                dto.setGrade(rs.getInt("grade"));
                dto.setBirth(rs.getString("birth"));
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
    
    // 모든 유저 조회
    public List<UserDto> selectAll() {
        List<UserDto> userList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = JdbcUtil.getCon();
            String sql = "SELECT * FROM USER1";

            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                UserDto dto = new UserDto();
                dto.setpCode(rs.getString("pcode"));
                dto.setUserId(rs.getString("USER_ID"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setAddr(rs.getString("addr"));
                dto.setJoinDate(rs.getDate("join_date"));
                dto.setGrade(rs.getInt("grade"));
                dto.setBirth(rs.getString("birth"));
                userList.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(con, pstmt, rs);
        }
        return userList;
    }
}
