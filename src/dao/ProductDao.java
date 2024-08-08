package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import db.JdbcUtil;
import dto.FileDto;
import dto.ProductDto;

public class ProductDao {
	public ArrayList<ProductDto> selectAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();

		try {
			con = JdbcUtil.getCon();
			String sql = "SELECT p.product_id, p.product_name, p.user_id, p.price, p.product_date, p.modify_date, "
					+ "p.wish_num, p.dong, p.product_status, p.category, p.hit, p.content, "
					+ "f.file_id, f.file_name, f.save_file_name " + "FROM product p "
					+ "LEFT JOIN file1 f ON p.product_id = f.product_id " + "ORDER BY p.product_id DESC";

			pstmt = con.prepareStatement(sql);
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

				// 파일 정보가 존재하면 파일 리스트에 추가
//					if (fileId > 0) { // fileId가 유효한 경우에만 처리
//						FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//						List<FileDto> files = product.getFiles(); // 파일 리스트를 가져온다.
//						files.add(file1); // 파일을 리스트에 추가	
//					}
				if (fileId > 0) { // fileId가 유효한 경우에만 처리
					FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//	                    List<FileDto> files = product.getFiles();// 파일 리스트를 가져온다.
//	                    files.add(file1); // 파일을 리스트에 추가
					product.setFileDto(file1);
				}

				// 리스트에 ProductDto 객체 추가
				list.add(product);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return list;
	}

	public ArrayList<ProductDto> selectHit() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();

		try {
			con = JdbcUtil.getCon();
			String sql = "SELECT p.product_id, p.product_name, p.user_id, p.price, p.product_date, p.modify_date, "
					+ "p.wish_num, p.dong, p.product_status, p.category, p.hit, p.content, "
					+ "f.file_id, f.file_name, f.save_file_name " + "FROM product p "
					+ "LEFT JOIN file1 f ON p.product_id = f.product_id " + "ORDER BY p.hit DESC, p.product_id DESC";

			pstmt = con.prepareStatement(sql);
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

				// 파일 정보가 존재하면 파일 리스트에 추가
//					if (fileId > 0) { // fileId가 유효한 경우에만 처리
//						FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//						List<FileDto> files = product.getFiles(); // 파일 리스트를 가져온다.
//						files.add(file1); // 파일을 리스트에 추가
//					}	
				if (fileId > 0) { // fileId가 유효한 경우에만 처리
					FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//	                    List<FileDto> files = product.getFiles();// 파일 리스트를 가져온다.
//	                    files.add(file1); // 파일을 리스트에 추가
					product.setFileDto(file1);
				}

				// 리스트에 ProductDto 객체 추가
				list.add(product);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return list;
	}

	public ArrayList<ProductDto> selectNew() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();

		try {
			con = JdbcUtil.getCon();
			String sql = "SELECT p.product_id, p.product_name, p.user_id, p.price, p.product_date, p.modify_date, "
					+ "p.wish_num, p.dong, p.product_status, p.category, p.hit, p.content, "
					+ "f.file_id, f.file_name, f.save_file_name " + "FROM product p "
					+ "LEFT JOIN file1 f ON p.product_id = f.product_id "
					+ "ORDER BY p.modify_date DESC, p.hit DESC, p.product_id DESC"; // product_date를 기준으로 정렬

			pstmt = con.prepareStatement(sql);
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

				// 파일 정보가 존재하면 파일 리스트에 추가
//			        if (fileId > 0) { // fileId가 유효한 경우에만 처리
//			            FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//			            List<FileDto> files = product.getFiles(); // 파일 리스트를 가져온다.
//			            if (files == null) {
//			                files = new ArrayList<>(); // 파일 리스트가 초기화되지 않은 경우 새로 생성
//			                product.setFiles(files);
//			            }
//			            files.add(file1); // 파일을 리스트에 추가
//			        }

				if (fileId > 0) { // fileId가 유효한 경우에만 처리
					FileDto file1 = new FileDto(fileId, fileName, saveFileName);
//	                    List<FileDto> files = product.getFiles();// 파일 리스트를 가져온다.
//	                    files.add(file1); // 파일을 리스트에 추가
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

	public int insert(ProductDto to) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int productId = -1; // 기본값 -1, 에러 발생 시 확인용

		try {
			con = JdbcUtil.getCon();
			con.setAutoCommit(false); // 트랜잭션 시작

			// String sql = "insert into product
			// values(product_id.nextval,?,?,?,sysdate,sysdate,0,?,?,?,0,?)";
			//
			// pstmt = con.prepareStatement(sql);
			String sqlInsert = "insert into product (product_id, product_name, user_id, price, product_date, modify_date,"
					+ "wish_num, dong, product_status, category, hit, content) "
					+ "VALUES (product_id.nextval, ?, ?, ?, SYSDATE, SYSDATE, 0, ?, ?, ?, 0, ?)";

			pstmt = con.prepareStatement(sqlInsert);
			pstmt.setString(1, to.getProductName());
			pstmt.setString(2, to.getUser_id());
			pstmt.setString(3, to.getPrice());
			pstmt.setString(4, to.getDong());
			pstmt.setString(5, to.getProductStatus());
			pstmt.setString(6, to.getCategory());
			pstmt.setString(7, to.getContent());
			int r = pstmt.executeUpdate();
			//System.out.println(to.getProductStatus());
			if (r > 0) {
				// 최근에 삽입된 제품의 ID를 얻기 위해 최대값을 조회합니다.
				String sqlSelect = "SELECT MAX(product_id) AS max_id FROM product";
				pstmt = con.prepareStatement(sqlSelect);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					productId = rs.getInt("max_id");
				}
			}

			con.commit(); // 트랜잭션 커밋

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productId = -1;
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}
		return productId;
		// public int insertFile(FileDto)
	}

	public ProductDto viewPost(int productId, String loginId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDto to = null;
		String user_id = null;
		
		try {
			con = JdbcUtil.getCon();
			//세션에서 사용자 아이디 가져오기
	        
			
			
	        String userIdSql = "select user_id from product where product_id=?";
	        pstmt = con.prepareStatement(userIdSql);
	        pstmt.setInt(1, productId);
	       
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	user_id = rs.getString("user_id");
	        	rs.close();
	            pstmt.close();
	        }   
	        
	        if (loginId == null || !loginId.equals(user_id)) {
                String updateSql = "UPDATE product SET hit = hit + 1 WHERE product_id=?";
                pstmt = con.prepareStatement(updateSql);
                pstmt.setInt(1, productId);
                pstmt.executeUpdate();
            }

			// 상세 정보 조회 쿼리
			String selectSql = "SELECT p.product_id, p.product_name, p.user_id, p.price, p.product_date, p.modify_date, "
					+ "p.wish_num, p.dong, p.product_status, p.category, p.hit, p.content, "
					+ "f.file_id, f.file_name, f.save_file_name " + "FROM product p "
					+ "LEFT JOIN file1 f ON p.product_id = f.product_id " + "WHERE p.product_id = ? "
					+ "ORDER BY f.file_id"; // 파일 정보는 ORDER BY로 정렬할 필요가 없음

			pstmt = con.prepareStatement(selectSql);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();

			to = new ProductDto();
			List<FileDto> fileList = new ArrayList<>();

			while (rs.next()) {
				// 제품 정보를 설정
				to.setProductId(rs.getInt("product_id"));
				to.setProductName(rs.getString("product_name"));
				to.setUser_id(rs.getString("user_id"));
				to.setPrice(rs.getString("price"));
				to.setProductDate(rs.getDate("product_date"));
				to.setModifyDate(rs.getDate("modify_date"));
				to.setWishNum(rs.getInt("wish_num"));
				to.setDong(rs.getString("dong"));
				to.setProductStatus(rs.getString("product_status"));
				to.setCategory(rs.getString("category"));
				to.setHit(rs.getInt("hit"));
				to.setContent(rs.getString("content"));
				
				// 파일 정보를 설정
				FileDto fileDto = new FileDto();
				fileDto.setFileId(rs.getString("file_id"));
				fileDto.setFileName(rs.getString("file_name"));
				fileDto.setSaveFileName(rs.getString("save_file_name"));

				fileList.add(fileDto);
			}

			// 모든 파일 정보를 ProductDto에 설정
			to.setFiles(fileList);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(con, pstmt, rs);
		}

		return to;
	}

	public int editPost(ProductDto to) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int n = -1;

		try {
			con = JdbcUtil.getCon();

			// 제품 정보 업데이트
			String sql = "UPDATE product SET " + "product_name = ?, " + "price = ?, " + "modify_date = SYSDATE, " // 수정
																													// 날짜를
																													// 현재
																													// 날짜로
																													// 설정
					+ "category = ?, " + "content = ? " + "WHERE product_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, to.getProductName());
			pstmt.setString(2, to.getPrice());
			pstmt.setString(3, to.getCategory());
			pstmt.setString(4, to.getContent());
			pstmt.setInt(5, to.getProductId());

			return n = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}

	public int delete(int productId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int n = 0;

		try {
			con = JdbcUtil.getCon();

			// 트랜잭션 시작
			con.setAutoCommit(false);

			// 파일 테이블에서 삭제
			String sqlFile = "DELETE FROM file1 WHERE product_id = ?";
			pstmt = con.prepareStatement(sqlFile);
			pstmt.setInt(1, productId);
			n += pstmt.executeUpdate(); // 파일 테이블에서 삭제된 행 수 추가

			// 상품 테이블에서 삭제
			String sqlProduct = "DELETE FROM product WHERE product_id = ?";
			pstmt = con.prepareStatement(sqlProduct);
			pstmt.setInt(1, productId);
			n += pstmt.executeUpdate(); // 상품 테이블에서 삭제된 행 수 추가

			// 트랜잭션 커밋
			con.commit();

		} catch (SQLException e) {
			e.printStackTrace();
			if (con != null) {
				try {
					// 트랜잭션 롤백
					con.rollback();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			n = -1; // 오류 발생 시 0으로 설정
		} finally {
			JdbcUtil.close(con, pstmt, null);
		}
		return n;
	}

	public ArrayList<ProductDto> searchSelect(String searchCondition, String searchInput) {
		ArrayList<ProductDto> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = JdbcUtil.getCon();

			// SQL 쿼리 초기화
			String sql = "SELECT p.product_id, p.product_name, p.user_id, p.price, p.product_date, p.modify_date, "
					+ "p.wish_num, p.dong, p.product_status, p.category, p.hit, p.content, "
					+ "f.file_id, f.file_name, f.save_file_name " + "FROM product p "
					+ "LEFT JOIN file1 f ON p.product_id = f.product_id " + "WHERE ";

			// 검색 조건에 따른 쿼리 구성
			if ("product_name".equals(searchCondition)) {
				sql += "p.product_name LIKE ?";
			} else if ("content".equals(searchCondition)) {
				sql += "p.content LIKE ?";
			} else if ("user_id".equals(searchCondition)) {
				sql += "p.user_id LIKE ?";
			} else {
				sql += "1 = 0"; // No condition
			}

			sql += " ORDER BY p.product_id DESC";

			// 쿼리 준비
			pstmt = con.prepareStatement(sql);

			// 검색 조건에 따라 파라미터 설정
			pstmt.setString(1, "%" + searchInput + "%");

			// 쿼리 실행
			rs = pstmt.executeQuery();

			// 결과 처리
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

				// 파일 정보가 존재하면 파일을 ProductDto에 추가
				if (fileId > 0) {
					FileDto file1 = new FileDto(fileId, fileName, saveFileName);
					product.setFileDto(file1); // ProductDto에 파일 추가 메서드 사용
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

	// 제품 상태 업데이트 메서드
	public int updateProductStatus(String productId, String productStatus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			String sql = "UPDATE product SET product_status = ? WHERE product_id = ?";
			
			con = JdbcUtil.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productStatus);
			pstmt.setString(2, productId);
			
			// 영향을 받은 행의 수를 반환
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		
	}

}
