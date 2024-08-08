package dao;

import db.JdbcUtil;
import dto.NotificationDto;
import dto.WishListDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class NotificationDao {

    public int insertNotification(HashMap<String, String> notificationMap) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int like = 2;
        int newNotiStatus = 1;
        try {
            con = JdbcUtil.getCon();
            String sql = "insert into NOTIFICATION values (notification_seq.nextval,?,?,?,?,sysdate, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, notificationMap.get("productUser_id"));
            pstmt.setString(2, notificationMap.get("user_id"));
            pstmt.setInt(3, like);
            pstmt.setString(4,notificationMap.get("content"));
            pstmt.setInt(5,newNotiStatus);

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            JdbcUtil.close(con, pstmt, null);
        }
    }

    public ArrayList<NotificationDto> likeSelect(String user_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<NotificationDto> list = new ArrayList<>();
        try {
            conn = JdbcUtil.getCon();
            String sql = "select * from notification where receiverId = ? and type = 2 and notiStatus = 1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                NotificationDto dto = new NotificationDto();
                dto.setId(rs.getInt("id"));
                dto.setReceiverId(rs.getString("receiverId"));
                dto.setSenderId(rs.getString("senderId"));
                dto.setType(rs.getInt("type"));
                dto.setContent(rs.getString("content"));
                dto.setCreatedAt(rs.getDate("createdAt"));
                list.add(dto);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            JdbcUtil.close(conn,pstmt,rs);
        }
    }

    public int updateStatus(String user_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = JdbcUtil.getCon();
            String sql = "update notification set notiStatus = 2 where receiverId = ? and notiStatus = 1 and type = 2";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_id);

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            JdbcUtil.close(con, pstmt, null);
        }
    }



    // 3. 게시글 댓글 알림 저장
    public int commentNotificationInsert(NotificationDto dto) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        int newNotiStatus = 1;
        try {
            conn = JdbcUtil.getCon();
            String sql = "insert into notification values(notification_seq.nextval, ?, ?, 3, ?, sysdate, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getReceiverId());
            pstmt.setString(2, dto.getSenderId());
            pstmt.setString(3, dto.getContent());
            pstmt.setInt(4, newNotiStatus);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("[에러] 알림 db에 저장이 불가합니다. " + e.getMessage());
            return -1;
        }

    }

    // 4. 댓글 알림 조회
    public ArrayList<NotificationDto> CommentSelect(String user_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<NotificationDto> list = new ArrayList<>();
        try {
            conn = JdbcUtil.getCon();
            String sql = "select * from notification where receiverId = ? and type = 3 and notiStatus = 1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                NotificationDto dto = new NotificationDto();
                dto.setId(rs.getInt("id"));
                dto.setReceiverId(rs.getString("receiverId"));
                dto.setSenderId(rs.getString("senderId"));
                dto.setType(rs.getInt("type"));
                dto.setContent(rs.getString("content"));
                dto.setCreatedAt(rs.getDate("createdAt"));
                list.add(dto);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            JdbcUtil.close(conn,pstmt,rs);
        }
    }

    public int updateStatus3(String user_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = JdbcUtil.getCon();
            String sql = "update notification set notiStatus = 2 where receiverId = ? and notiStatus = 1 and type = 3";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_id);

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            JdbcUtil.close(con, pstmt, null);
        }
    }
}


