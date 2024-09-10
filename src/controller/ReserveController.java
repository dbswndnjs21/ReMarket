package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;

@WebServlet("/reserve.do")
public class ReserveController extends HttpServlet {

	@Override
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String productStatus = req.getParameter("productStatus");
        String returnPage = req.getParameter("returnPage"); // returnPage 파라미터 받기
        
        ProductDao dao = new ProductDao();
        int n;
        String message;

        if (productStatus.equals("1")) {
            n = dao.updateProductStatus(productId, "2"); // 2는 예약처리
            message = "판매예약이 완료되었습니다.";
        } else if (productStatus.equals("2")) {
            n = dao.updateProductStatus(productId, "3"); // 3은 판매완료
            message = "판매가 완료되었습니다.";
        } else {
            message = "잘못된 요청입니다.";
            resp.sendRedirect("/WEB-INF/views/errorPage.jsp?rmg=" + URLEncoder.encode(message, "UTF-8"));
            return;
        }
        

        
        
        
        if (n > 0) {
            // 성공 메시지를 세션에 저장하고 리다이렉션
        	  
            req.getSession().setAttribute("rmg", message);
           
            resp.sendRedirect("/viewPost.do?productId=" + productId + "&returnPage=" + URLEncoder.encode(returnPage, "UTF-8"));
        } else {
            // 오류 메시지를 세션에 저장하고 리다이렉션
            req.getSession().setAttribute("rmg", "처리 실패. 다시 시도해 주세요.");
            resp.sendRedirect("/viewPost.do?productId=" + productId);
        }
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
}