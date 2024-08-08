package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BlameDao;

@WebServlet("/completeBlame.do")
public class CompleteBlameController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 req.setCharacterEncoding("UTF-8");
         resp.setContentType("text/html; charset=UTF-8");

         String idStr = req.getParameter("blameId");
         String userName = req.getParameter("userName");
         
        try {
        	int id = Integer.parseInt(idStr);
            BlameDao blameDao = new BlameDao();
            
            // 게시물 처리완료 로직
            blameDao.completeBlame(id);
            
            // 게시물 처리거부 로직
            blameDao.refuseBlame(id);
            
            
            // 알림 전송 로직 (작성자에게 알림 전송)
            blameDao.sendNotification(userName, "신고 신청이 처리되었습니다.");
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
