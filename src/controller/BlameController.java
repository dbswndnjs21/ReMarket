package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlameDao;
import dto.BlameDto;
@WebServlet("/blameBoard.do")
public class BlameController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		BlameDao dao = new BlameDao();
		
		// 페이징 처리
			/* 필요한 변수
			 * 1. 현재 페이지 번호: currentPage
			 * 2. 총 게시글 수 : totalPosts  -> BlameDao클래스, getTotalPostCount() 메서드 활용
			 * 3. 페이지당 게시글 수: postsPerPage = 10 -> 10개로 설정
			 * 4. 총 페이지 수: totalPages 
			 * 5. 시작 인덱스 : startIndex 
			 * */
		
		// 페이지당 게시글 수
        int postsPerPage = 10;
		
		 // 현재 페이지 번호 가져오기
        String pageParam = req.getParameter("page");
        int currentPage = (pageParam == null || pageParam.isEmpty()) ? 1 : Integer.parseInt(pageParam);
		
		 // 검색 기능 파라미터
        String condition = req.getParameter("condition");
        String keyword = req.getParameter("keyword");
        
        System.out.println("condition: " + condition);
        System.out.println("keyword : " + keyword);
		
        ArrayList<BlameDto> lists;
		int totalPosts;
		int totalsPages;
		
		// 시작 인덱스 계산
        int startIndex = (currentPage - 1) * postsPerPage;
        
		if (condition != null && keyword != null && !keyword.isEmpty()) {
			// 검색 기능이 활성화된 경우
			lists = dao.searchPosts(condition, keyword);
			totalPosts = lists.size();
			totalsPages = (int) Math.ceil((double)totalPosts / postsPerPage);
		} else {
			// 전체 신고 목록 가져오기
			totalPosts = dao.getTotalPostCount();
			totalsPages = (int) Math.ceil((double)totalPosts / postsPerPage);
			lists = dao.selectAll(startIndex, postsPerPage);
		}
		System.out.println("lists : " + lists);
		req.setAttribute("lists", lists);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalsPages", totalsPages);
		req.setAttribute("condition", condition);
	    req.setAttribute("keyword", keyword);
	    
		req.getRequestDispatcher("WEB-INF/views/blameBoardPage.jsp").forward(req, resp);
	}
}
