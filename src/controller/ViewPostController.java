package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
import dto.ProductDto;
@WebServlet("/viewPost.do")
public class ViewPostController extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
	   HttpSession session = req.getSession();
       String loginId = (String) session.getAttribute("user_id");
	   
	   // returnPage 파라미터가 있을 때만 세션에 저장
       String returnPage = req.getParameter("returnPage");
       if (returnPage == null || returnPage.isEmpty()) {
           // returnPage가 없으면 referer 헤더에서 값 추출
           returnPage = req.getHeader("referer");
       }
       
       // returnPage 값이 있으면 세션에 저장
       if (returnPage != null && !returnPage.isEmpty()) {
           req.getSession().setAttribute("returnPage", returnPage);
       }
	  //System.out.println(returnPage);
	  
	   
      int productId = Integer.parseInt(req.getParameter("productId"));
      
      ProductDto to = new ProductDto();
      
      
      ProductDao dao = new ProductDao();
      to = dao.viewPost(productId,loginId);
      
      req.setAttribute("to", to);
      
      // JSP 페이지로 포워딩
       RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/viewPost.jsp");
       dispatcher.forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(req,resp);
   }
}
