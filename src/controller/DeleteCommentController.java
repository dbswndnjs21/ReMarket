package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
@WebServlet("/deleteComment.do")
public class DeleteCommentController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int commentId = Integer.parseInt(req.getParameter("commentId"));
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		CommentDao dao = new CommentDao();
		int result = dao.deleteComment(commentId);
		System.out.println(result);
		if(result == 1) {
			resp.sendRedirect(req.getContextPath() + "/viewBoard.do?id=" + boardId);
		} else {
			System.out.println("댓글 삭제 실패");
		}
		
	
	}
}
