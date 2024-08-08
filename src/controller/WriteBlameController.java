package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlameDao;
import dto.BlameDto;

@WebServlet("/writeBlame.do")
public class WriteBlameController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 해당 게시물의 작성자와 제목을 요청 매개변수로 가져온다.
		String author = req.getParameter("author");
		String postTitle = req.getParameter("postTitle");
		String productId = req.getParameter("productId");
		
		// 요청 속성으로 설정. jsp에서 사용하게 만든다.
		req.setAttribute("author", author);
		req.setAttribute("postTitle", postTitle);
		req.setAttribute("productId", productId);
		
		req.getRequestDispatcher("writeBlame.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String author = req.getParameter("author");
		String postTitle = req.getParameter("postTitle");
		
		req.setAttribute("author", author);
		req.setAttribute("postTitle", postTitle);
		
	    // 디버깅용 출력
	    System.out.println("userId: " + req.getParameter("userId"));
	    System.out.println("postAuthor: " + req.getParameter("postAuthor"));
	    System.out.println("postTitle: " + req.getParameter("postTitle"));
	    
		// 신고 -> db에 저장
		BlameDto dto = new BlameDto(0, postTitle, postTitle, postTitle, postTitle, null, 0, postTitle, postTitle, postTitle, 0);
		dto.setpCode(req.getParameter("userId"));
		dto.setUserName(req.getParameter("userName"));
		dto.setProduct_name(req.getParameter("postTitle"));
		dto.setBlameUser(req.getParameter("postAuthor"));
		dto.setBlameTitle(req.getParameter("title"));	
		dto.setBlameCategory(req.getParameter("blameCategory"));
		dto.setBlameContent(req.getParameter("content"));
		dto.setProduct_id(Integer.parseInt(req.getParameter("productId")));
	    
		
		BlameDao dao = new BlameDao();
	    int result = dao.insert(dto);
	   
	    if (result == 1) {
	    	System.out.println("blame데이터 저장 완료");
	    } else {
	    	System.out.println("실패");
	    	req.setAttribute("errorMessage", "신고 등록에 실패했습니다.");
            req.getRequestDispatcher("/writeBlame.jsp").forward(req, resp);
	    }
	    
	    // 성공 페이지로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/blameResult.jsp");
	}
}
