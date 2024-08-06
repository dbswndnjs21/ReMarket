package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
@WebServlet("/editBoard.do")
public class EditBoardController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardDao dao = new BoardDao();
		dao.updateBoard(id, title, content);
		
		resp.sendRedirect("viewBoard.do?id=" + id);
	}
	
	
}
