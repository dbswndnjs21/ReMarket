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
import dao.NotificationDao;
import dto.BoardDto;
@WebServlet("/board.do") 
public class BoardController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		BoardDao dao = new BoardDao();
		CommentDao commentDao = new CommentDao();
		// 페이징 처리
			/* 필요한 변수
			 * 1. 현재 페이지 번호: currentPage
			 * 2. 총 게시글 수 : totalPosts  -> BoardDao클래스, getTotalPostCount() 메서드 활용
			 * 3. 페이지당 게시글 수: postsPerPage = 10 -> 10개로 설정
			 * 4. 총 페이지 수: totalPages 
			 * 5. 시작 인덱스 : startIndex 
			 * */
		
		// 1. 페이지당 게시글 수 설정
		int postsPerPage = 10;
		
		// 2. 현재 페이지 번호 가져오기 
		String pageParam = req.getParameter("page"); // url 파라미터에서 페이지 번호 가져오기
		int currentPage = (pageParam == null || pageParam.isEmpty()) ? 1 : Integer.parseInt(pageParam); // 기본값 1
		
		// 검색 기능 파라미터 
        String condition = req.getParameter("condition"); // 제목, 내용, 작성자
        String keyword = req.getParameter("keyword"); // 검색 키워드
		
        
        ArrayList<BoardDto> lists;
		int totalPosts;
		int totalsPages;
		// 5. 시작 인덱스 계산
		int startIndex = (currentPage-1)*postsPerPage;
        
		if (condition != null && keyword != null && !keyword.isEmpty()) {
			totalPosts = dao.getTotalSearchCount(condition, keyword);
			
			lists = dao.searchPosts(condition, keyword, startIndex, postsPerPage);
			totalsPages = (int) Math.ceil((double)totalPosts / postsPerPage);
			
			
			
		} else {
			// 3. 전체 게시글 수 가져오기
			totalPosts = dao.getTotalPostCount(); // 전체 게시글 수를 가져오는 메서드 실행
			// 4. 총 페이지 수 계산
						// 예시 1: 총 게시글 20 / 페이지당 게시글 수 10(고정) -> 2 
						// 예시 2: 총 게시글 21 / 페이지당 게시글 수 10(고정) -> 3페이지가 나와야함. -> 올림처리 연산 필수
			totalsPages = (int) Math.ceil((double)totalPosts / postsPerPage);
			
			// 6. 현재 페이지에 해당하는 게시글 목록 가져오기. 
			lists = dao.selectAll(startIndex, postsPerPage);
		}
		
		// 각 게시글에 대한 댓글 개수를 설정
        for (BoardDto dto : lists) {
            int commentCount = commentDao.getCommentCount(dto.getId()); // 댓글 개수 조회
            dto.setCommentCount(commentCount); // 댓글 개수 설정
        }
		
		
		HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");
        // 알림에서 들어올실 알림 읽음 표시로 변경 1->2
        NotificationDao updateNotification = new NotificationDao();
        updateNotification.updateStatus3(user_id);

		req.setAttribute("lists", lists);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalsPages", totalsPages);
		req.setAttribute("condition", condition);
	    req.setAttribute("keyword", keyword);
	    
		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
	}
	
}
