package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlameDao;
import dto.BlameDto;
@WebServlet("/viewBlame.do")
public class ViewBlameController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시글 id 받기
		String id = req.getParameter("blameId");
		
		BlameDao dao = new BlameDao();
		BlameDto dto = dao.selectById(Integer.parseInt(id));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/viewBlame.jsp").forward(req, resp);
		
	}
}
