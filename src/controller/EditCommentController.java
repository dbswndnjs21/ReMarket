package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
@WebServlet("/editComment.do")
public class EditCommentController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int boardid =  Integer.parseInt(req.getParameter("comment-boardId")); 
		int commentid = Integer.parseInt(req.getParameter("comment-id"));
		String commentContent = req.getParameter("comment-content");
		
		CommentDao commentDao = new CommentDao();
		commentDao.updateComment(commentid, commentContent);
		resp.sendRedirect("/viewBoard.do?id=" + boardid);
		
		
		
	}
}
