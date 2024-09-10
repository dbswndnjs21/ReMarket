package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.CommentDao;
import dao.NotificationDao;
import dto.CommentDto;
import dto.NotificationDto;
@WebServlet("/comment.do")
public class CommentController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// db에 댓글 저장.
		CommentDao dao = new CommentDao();
		CommentDto dto = new CommentDto();
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		
		dto.setBoardId(boardId);
		dto.setContent(req.getParameter("commentContent"));
		dto.setUserName(req.getParameter("userName"));
		int result = dao.insertComment(req, dto);
		
		HttpSession httpSession = req.getSession();
		String userId = (String) httpSession.getAttribute("user_id");
		
		
		
		 if (result == 1) {
		    	System.out.println("db에 댓글 저장 완료");
		    	
		    //db에 댓글이 저장된다면 "알림 테이블 저장"
		    	BoardDao boardDao = new BoardDao();
		    	String boardUserId = boardDao.getBoardUserID(boardId);
		    	
		    	NotificationDao notificationDao = new NotificationDao();
		    	NotificationDto notificationDto = new NotificationDto();
		    	
		    	notificationDto.setReceiverId(boardUserId); // 받는 사람: 게시글 작성자 id, board 테이블   
		    	notificationDto.setSenderId(userId); // 보내는 사람 : 댓글 작성자id 
		    	notificationDto.setContent("새 댓글이 달렸습니다. " + req.getParameter("userName") + "님: "+ req.getParameter("commentContent"));
		    	System.out.println("댓글 작성자 id:" + userId);
		    	System.out.println("게시물 작성자 id: " + boardUserId);
		    	System.out.println("댓글 내용" + req.getParameter("commentContent"));
		    	int notificationResult = notificationDao.commentNotificationInsert(notificationDto);
		    	if (notificationResult == 1) {
	                System.out.println("알림 저장 완료");
	                
	            } else {
	                System.out.println("알림 저장 실패");
	            }
		    	
		    } else {
		    	System.out.println("댓글 저장 실패");
		    }
		 
		 // 데이터를 리다이렉트로 보내서 ViewBoardController의 doGet 메서드가 호출되도록 함
	        resp.sendRedirect(req.getContextPath() + "/viewBoard.do?id=" + dto.getBoardId());
		 
	}
}
