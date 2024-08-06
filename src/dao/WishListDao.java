package dao;

import db.JdbcUtil;
import dto.WishListDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class WishListDao {

    public int likeInsert(HashMap<String, String> likeMap) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int like_status = 1; // 등록상태
        try {
            con = JdbcUtil.getCon();
            String sql = "insert into product_like values (product_like_seq.nextval,sysdate,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, like_status);
            pstmt.setString(2, likeMap.get("user_id"));
            pstmt.setString(3, likeMap.get("productId"));

            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            JdbcUtil.close(con, pstmt, null);
        }
    }

    public ArrayList<WishListDto> likeSelect(String user_id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<WishListDto> list = new ArrayList<>();
        try {
            conn = JdbcUtil.getCon();
            String sql = "select p.product_id, p.product_name, i.user_id, p.price, p.content, f.save_file_name, p.user_id as writer " +
                        "from product_like i, product p, file1 f " +
                        "where p.product_id = i.product_id " +
                        "and p.product_id = f.product_id " +
                        "and i.user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                WishListDto dto = new WishListDto();
                dto.setProductId(rs.getString("product_id"));
                dto.setProductName(rs.getString("product_name"));
                dto.setUser_id(rs.getString("user_id"));
                dto.setPrice(rs.getString("price"));
                dto.setContent(rs.getString("content"));
                dto.setSaveFileName(rs.getString("save_file_name"));
                dto.setWriter(rs.getString("writer"));
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


    public boolean checkUserID(HashMap<String, String> likeMap) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean exists = false;
        try {
            conn = JdbcUtil.getCon();
            String sql = "SELECT COUNT(*) FROM product_like WHERE user_id = ? and product_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, likeMap.get("user_id"));
            pstmt.setString(2, likeMap.get("productId"));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                exists = count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            JdbcUtil.close(conn,pstmt,rs);
        }
        return exists;
    }

}

