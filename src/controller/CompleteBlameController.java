package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BlameDao;
import dao.NotificationDao;
import dto.NotificationDto;

@WebServlet("/completeBlame.do")
public class CompleteBlameController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 req.setCharacterEncoding("UTF-8");
         resp.setContentType("text/html; charset=UTF-8");

         String idstr = req.getParameter("blameId");
         String userName = req.getParameter("userName");
         String action = req.getParameter("action");
         
         System.out.println("blameId :" + idstr);
         try {
        	int id = Integer.parseInt(idstr);
            BlameDao blameDao = new BlameDao();
            
           
	    	
            if ("complete".equals(action)) {
                // 게시물 처리완료 로직
                blameDao.completeBlame(id);
               
            } else if ("refuse".equals(action)) {
                // 게시물 처리거부 로직
                blameDao.refuseBlame(id);
                
            }

         // 처리 완료 후 목록 페이지로 리다이렉트
            resp.sendRedirect("blameBoard.do");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 요청입니다.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류가 발생했습니다.");
        }
    }
}