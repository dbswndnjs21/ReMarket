package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import dao.ProductDao;
import dto.ProductDto;
@WebServlet("/main.do")
public class MainController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductDao productDao = new ProductDao();

		// 읽은 쪽지가 있는지 확인
		MessageDao messageDao = new MessageDao();
		HttpSession session = req.getSession();
		String  user_id = (String) session.getAttribute("user_id");
		boolean hasUnreadMessages = messageDao.hasUnreadMessages(user_id);
		session.setAttribute("hasUnreadMessages", hasUnreadMessages);
		if(user_id == null) {
			user_id = "";
		}
	    
	    // 전체 상품 조회
	    ArrayList<ProductDto> allProducts = productDao.selectAll();

	    // 인기 상품 조회
	    ArrayList<ProductDto> allHitItems = productDao.selectHit();
	    ArrayList<ProductDto> hitItems = new ArrayList<>(allHitItems.subList(0, Math.min(4, allHitItems.size())));
	    
	    // 최신 상품 조회
	    ArrayList<ProductDto> allNewItems = productDao.selectNew();
	    ArrayList<ProductDto> newItem = new ArrayList<>(allNewItems.subList(0, Math.min(4, allNewItems.size())));
	    
	    // 카테고리별로 1개씩 상품 조회
	    ArrayList<String> categories = new ArrayList<>();
	    for (ProductDto product : allProducts) {
	        if (!categories.contains(product.getCategory())) {
	            categories.add(product.getCategory());
	        }
	    }

	    ArrayList<ProductDto> categoryItems = new ArrayList<>();
	    for (String category : categories) {
	        for (ProductDto product : allProducts) {
	            if (product.getCategory().equals(category)) {
	                categoryItems.add(product);
	                break; // 각 카테고리당 1개만 추가
	            }
	        }
	        if (categoryItems.size() >= 4) {
	            break; // 4개 카테고리만
	        }
	    }
	    // 요청 속성에 데이터 설정
	    req.setAttribute("hitItems", hitItems);
	    req.setAttribute("newItem", newItem);
	    req.setAttribute("categoryItems", categoryItems);
	    // JSP 페이지로 포워딩
	    RequestDispatcher dispatcher = req.getRequestDispatcher("/main.jsp");
	    dispatcher.forward(req, resp);
	}
}
