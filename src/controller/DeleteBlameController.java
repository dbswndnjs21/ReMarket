package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlameDao;
@WebServlet("/deleteBlame.do")
public class DeleteBlameController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("blameId"));
		BlameDao dao = new BlameDao();
		dao.deleteBlame(id);
		resp.sendRedirect(req.getContextPath() + "/blame.do");
	
	}
}
