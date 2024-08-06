package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.ProductDto;

@WebServlet("/searchProduct.do")
public class SearchProductController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchCondition = req.getParameter("searchCondition");
		String searchInput = req.getParameter("searchInput");

		ProductDao dao = new ProductDao();
		ArrayList<ProductDto> list = dao.searchSelect(searchCondition, searchInput);

		req.setAttribute("list", list);
		req.getRequestDispatcher("searchProduct.jsp").forward(req, resp);
	}
}
