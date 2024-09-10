package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.CommentDao;
import dao.SelectUserDao;
import dto.BoardDto;
import dto.CommentDto;
import dto.UserDto;
@WebServlet("/viewBoard.do")
public class ViewBoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시글 id 받기
		int id = Integer.parseInt(req.getParameter("id"));
		BoardDao dao = new BoardDao();
		BoardDto dto = dao.selectById(id);
		
		CommentDao commentDao = new CommentDao();
		ArrayList<CommentDto> commentList = commentDao.selectByBoardId(id);
		
		// 로그인 한 아이디를 세션으로 받고 selectuserDao를 통해 해당 아이디의 이름 가져오기 -> 댓글 작성에 활용
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("user_id");
		 String userName = null;
		 Integer pcode = null;
		 
		if(userId != null) {
			SelectUserDao userDao = new SelectUserDao();
			UserDto userDto = userDao.select(userId);
			 if(userDto != null) {
				userName = userDto.getName();
				pcode = Integer.parseInt(userDto.getpCode());
			}
		}
		
		// userName이 null인 경우 login 하라는 메시지 설정
		if (userName == null) {
			 req.setAttribute("loginMessage", "로그인 후 이용 가능합니다.");
		}
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("userName", userName);
		req.setAttribute("pcode", pcode);
		req.setAttribute("commentList", commentList);
		req.getRequestDispatcher("/WEB-INF/views/viewBoard.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수정 버튼 클릭 시, editBoard.jsp로 이동 
		String id = req.getParameter("id");
				
		BoardDao dao = new BoardDao();
		BoardDto dto = dao.selectById(Integer.parseInt(id));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/WEB-INF/views/editBoard.jsp").forward(req, resp);
	
	}
	
}
