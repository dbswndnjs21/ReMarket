package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/serviceCenter.do")
public class ServiceCenterController extends HitController {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 req.getRequestDispatcher("/WEB-INF/views/serviceCenter.jsp").forward(req, resp);
	}
}
