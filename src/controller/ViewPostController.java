package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.ProductDto;
@WebServlet("/viewPost.do")
public class ViewPostController extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
	  String returnPage = req.getHeader("Referer");
	  if (returnPage != null && !returnPage.isEmpty()) {
	        req.getSession().setAttribute("returnPage", returnPage);
	    }
	  
	  
	   
      int productId = Integer.parseInt(req.getParameter("productId"));
      
      ProductDto to = new ProductDto();
      
      
      ProductDao dao = new ProductDao();
      to = dao.viewPost(productId);
      
      req.setAttribute("to", to);
      
      // JSP 페이지로 포워딩
       RequestDispatcher dispatcher = req.getRequestDispatcher("/viewPost.jsp");
       dispatcher.forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(req,resp);
   }
}
