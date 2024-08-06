package dao;

import db.JdbcUtil;
import dto.FileDto;
import dto.ProductDto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyWriteListDao {

    public ArrayList<ProductDto> selectList(String user_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<ProductDto> list = new ArrayList<>();

        try {
            con = JdbcUtil.getCon();
            String sql = "SELECT p.product_id, p.product_name, p.user_id, p.price, p.product_date, p.modify_date, "
                    + "p.wish_num, p.dong, p.product_status, p.category, p.hit, p.content, "
                    + "f.file_id, f.file_name, f.save_file_name "
                    + "FROM product p "
                    + "LEFT JOIN file1 f ON p.product_id = f.product_id "
                    + "WHERE p.user_id = ? "
                    + "ORDER BY p.product_id DESC";
            System.out.println(sql);

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String userId = rs.getString("user_id");
                String price = rs.getString("price");
                Date productDate = rs.getDate("product_date");
                Date modifyDate = rs.getDate("modify_date");
                int wishNum = rs.getInt("wish_num");
                String dong = rs.getString("dong");
                String productStatus = rs.getString("product_status");
                String category = rs.getString("category");
                int hit = rs.getInt("hit");
                String content = rs.getString("content");

                int fileId = rs.getInt("file_id");
                String fileName = rs.getString("file_name");
                String saveFileName = rs.getString("save_file_name");

                ProductDto product = new ProductDto(productId, productName, userId, price, productDate, modifyDate,
                        wishNum, dong, productStatus, category, hit, content);


                if (fileId > 0) { // fileId가 유효한 경우에만 처리
                    FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//                    List<FileDto> files = product.getFiles();// 파일 리스트를 가져온다.
//                    files.add(file1); // 파일을 리스트에 추가
                    product.setFileDto(file1);
                }

                // 리스트에 ProductDto 객체 추가
                list.add(product);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(con, pstmt, rs);
        }
        return list;
    }
}
