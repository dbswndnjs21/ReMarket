package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import dto.CommentDto;
@WebServlet("/comment.do")
public class CommentController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		CommentDao dao = new CommentDao();
		CommentDto dto = new CommentDto();
		dto.setBoardId(Integer.parseInt(req.getParameter("boardId")));
		dto.setContent(req.getParameter("commentContent"));
		dto.setUserName(req.getParameter("userName"));
		int result = dao.insertComment(dto);
		
		
		
		 if (result == 1) {
		    	System.out.println("db에 댓글 저장 완료");
		    } else {
		    	System.out.println("실패");
		    }
		 
		 // 데이터를 리다이렉트로 보내서 ViewBoardController의 doGet 메서드가 호출되도록 함
	        resp.sendRedirect(req.getContextPath() + "/viewBoard.do?id=" + dto.getBoardId());
		 
	}
}
