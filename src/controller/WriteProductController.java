package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FileDao;
import dao.ProductDao;
import dto.FileDto;
import dto.ProductDto;

 
@WebServlet("/writeProduct.do")
public class WriteProductController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		if(user_id != null && !user_id.trim().isEmpty()) {
			req.getRequestDispatcher("/WEB-INF/views/writeProduct.jsp").forward(req, resp);
			
		}else {
			resp.sendRedirect(req.getContextPath() + "/login.do");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		ServletContext application = req.getServletContext();
		
		String uploadPath = application.getRealPath("/upload");// upload폴더의 실체경로 얻어오기
	
		//C:\\java\\jsp-workspace\\semi\\src\\main\\webapp\\upload
		//String uploadPath = req.getContextPath() + "/upload/" ; 
		//System.out.println(uploadPath);
		//System.out.print(uploadPath + "<br>");
		
		MultipartRequest mr = new MultipartRequest(req, uploadPath, // 저장할 디렉토리
				1024 * 1024 * 5, // 업로드할 최대 크기 바이트
				"utf-8", 
				new DefaultFileRenamePolicy());
		
		//product 테이블
		String productName = mr.getParameter("productName");
		String user_id = (String)session.getAttribute("user_id");
		String price = mr.getParameter("price");
		String category = mr.getParameter("category");
		String content = mr.getParameter("content");
		String dong = "";
		String productStatus = "1";
		//file1 테이블
		//System.out.println(productStatus);
		String fileName = mr.getOriginalFileName("file1"); // 전송된 파일명
		String saveFileName = mr.getFilesystemName("file1"); // 저장된 파일명
		File f = mr.getFile("file1");
		long filesize = f.length(); // 파일크기
		//ProductDto to = new ProductDto(0, product_name,content);
		ProductDao dao = new ProductDao();
		ProductDto to = new ProductDto(productName,user_id,price,dong,productStatus,category,content);
		int productId = dao.insert(to);
		
		
		FileDao fdao = new FileDao();
		FileDto fto = new FileDto(productId,fileName,saveFileName);
		int n = fdao.insert(fto);
		
		
		if (n > 0) {
			req.setAttribute("fto", fto);
			req.setAttribute("to", to);
			req.getRequestDispatcher("/main.do").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/error.jsp");
		}
		
	}
}
