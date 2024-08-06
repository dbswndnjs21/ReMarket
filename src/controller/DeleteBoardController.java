package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
@WebServlet("/deleteBoard.do")
public class DeleteBoardController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		BoardDao dao = new BoardDao();
		dao.deleteBoard(id);
		resp.sendRedirect(req.getContextPath() + "/board.do");
	
	}
}
