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
@WebServlet("/editPost.do")
public class EditPostController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productId = Integer.parseInt(req.getParameter("productId"));
        ProductDao dao = new ProductDao();
        ProductDto to = dao.viewPost(productId);
        req.setAttribute("to", to);
        req.getRequestDispatcher("/editPost.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ServletContext application = req.getServletContext();
		String updatePath = application.getRealPath("/upload"); //업로드 폴더 실제경로 얻어오기
		//String updatePath = "C:\\java\\jsp-workspace\\semi\\src\\main\\webapp\\upload";
		
		MultipartRequest mr = new MultipartRequest(req, 
				updatePath,
				1024 * 1024 * 5,
				"utf-8",
				new DefaultFileRenamePolicy());
		//기존 파일 삭제를 위한 변수
		String deleteFile = mr.getParameter("saveFileName");
	    // viewPost에서 가져온값 
	    int productId = Integer.parseInt(mr.getParameter("productId"));
	    String productName = mr.getParameter("productName");
	    String user_id = (String)session.getAttribute("user_id");
	    String price = mr.getParameter("price");
	    String content = mr.getParameter("content");
	    String dong = "";
	    String productStatus = "";
	    String category = mr.getParameter("category");
	    String fileName = mr.getOriginalFileName("file1");
	    String saveFileName = mr.getFilesystemName("file1");
	    
	    ProductDao dao = new ProductDao();
	    ProductDto to = new ProductDto(productId, productName, user_id, price, null, null, 0, dong, productStatus, category, 0, content);
		int n = dao.editPost(to);
		
		FileDao fdao = new FileDao();
		FileDto fto = new FileDto(productId, fileName, saveFileName);
		int x = fdao.editFile(fto);
		
		if ( n > 0 && x > 0) {
			File file = new File(updatePath + "/" + deleteFile);
			file.delete();
			req.setAttribute("fto", fto);
			req.setAttribute("to", to);
			req.getRequestDispatcher("/main.do").forward(req,resp);
		}else {
			resp.sendRedirect(req.getContextPath() + "/error.jsp");
		}
		
	}
}
