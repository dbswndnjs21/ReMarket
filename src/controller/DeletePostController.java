package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.Sender;

import dao.FileDao;
import dao.ProductDao;
@WebServlet("/deletePost.do")
public class DeletePostController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String path = req.getServletContext().getRealPath("/upload");
		String path = "C:\\java\\jsp-workspace\\semi\\src\\main\\webapp\\upload";
		
		//System.out.println(path);
		String deleteFile = req.getParameter("saveFileName");
		//System.out.println(deleteFile);
		
		int productId = Integer.parseInt(req.getParameter("productId"));
		//System.out.println(productId);
		ProductDao dao = new ProductDao();
		
		int n = dao.delete(productId);
		//System.out.println(n);
		if(n > 1) {
			File file = new File(path + "/" + deleteFile );
			file.delete();
			
			req.getRequestDispatcher("/main.do").forward(req, resp);	
		}else {
			resp.sendRedirect("/error.jsp");
		}
		
		
	}
}
