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
import dao.SelectUserDao;
import dto.BoardDto;
import dto.UserDto;

@WebServlet("/writeBoard.do")
public class WriteBoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("user_id");
		// 로그인 안할 경우, 로그인 창으로 이동.
		if (userId == null) {
			resp.sendRedirect(req.getContextPath() + "/login.do");
		} else {
			// 로그인 아이디가 세션에 담겨져 있을 경우.
			SelectUserDao dao = new SelectUserDao();
			UserDto dto = dao.select(userId);
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/writeBoard.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 게시글 등록 -> db에 저장하기
		BoardDto dto = new BoardDto();
		dto.setUserId(req.getParameter("userId"));
		
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
	     
	    BoardDao dao = new BoardDao();
	    int result = dao.insert(dto);
	   
	    if (result == 1) {
	    	System.out.println("db에 게시글 저장 완료");
	    } else {
	    	System.out.println("실패");
	    }
	    
	    resp.sendRedirect(req.getContextPath() + "/board.do");
	    // 이렇게 접근하면 board.do 컨트롤러로 이동하지만 url은 writeBoard.do로 남아있음. -> 페이징 처리에서 버그 발생.
	    // sendRedirect 사용해야 함.
//	    RequestDispatcher rd = req.getRequestDispatcher("board.do");
//	    rd.forward(req, resp);
	}
	
	
	
}
