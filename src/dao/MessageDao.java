package dao;

import db.JdbcUtil;
import dto.MessageDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDao {
    private Connection con;

    public MessageDao() {
        con = JdbcUtil.getCon();
    }

    public List<MessageDto> getMessages(String userId) {
        List<MessageDto> messages = new ArrayList<>();
        String sql = "SELECT * FROM messages WHERE receive_id = ? ORDER BY send_date DESC";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MessageDto dto = new MessageDto();
                    dto.setMsgId(rs.getInt("MSG_ID"));
                    dto.setUser_id(rs.getString("USER_ID"));
                    dto.setSendId(rs.getString("SEND_ID"));
                    dto.setReceiveId(rs.getString("RECEIVE_ID"));
                    dto.setProductName(rs.getString("PRODUCT_NAME"));
                    dto.setContent(rs.getString("CONTENT"));
                    dto.setSendDate(rs.getTimestamp("SEND_DATE"));
                    dto.setMsgStatus(rs.getInt("MSG_STATUS"));
                    messages.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(con);
        }
        return messages;
    }

    public List<MessageDto> getSentMessages(String userId) {
        List<MessageDto> messages = new ArrayList<>();
        String sql = "SELECT * FROM messages WHERE send_id = ? ORDER BY send_date DESC";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    MessageDto dto = new MessageDto();
                    dto.setMsgId(rs.getInt("MSG_ID"));
                    dto.setUser_id(rs.getString("USER_ID"));
                    dto.setSendId(rs.getString("SEND_ID"));
                    dto.setReceiveId(rs.getString("RECEIVE_ID"));
                    dto.setProductName(rs.getString("PRODUCT_NAME"));
                    dto.setContent(rs.getString("CONTENT"));
                    dto.setSendDate(rs.getTimestamp("SEND_DATE"));
                    dto.setMsgStatus(rs.getInt("MSG_STATUS"));
                    messages.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(con);
        }
        return messages;
    }

    public void sendMessage(MessageDto message) {
        String sql = "INSERT INTO messages (msg_id, user_id, send_id, receive_id, product_name, content, send_date, msg_status) VALUES (msg_id.nextval, ?, ?, ?, ?, ?, SYSDATE, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, message.getUser_id());
            pstmt.setString(2, message.getSendId());
            pstmt.setString(3, message.getReceiveId());
            pstmt.setString(4, message.getProductName());
            pstmt.setString(5, message.getContent());
            pstmt.setInt(6, message.getMsgStatus());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(con);
        }
    }

    public void deleteMessage(int msgId) {
        String sql = "DELETE FROM messages WHERE msg_id = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, msgId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(con);
        }
    }
}
