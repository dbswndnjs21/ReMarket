package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dto.ProductDto;
@WebServlet("/hit.do")
public class HitController extends HttpServlet{
	private static final int ITEMS_PER_PAGE = 10;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductDao dao = new ProductDao();
		ArrayList<ProductDto> list = dao.selectHit();
		
		
		// 페이지 번호 설정
        int page = 1;
        if (req.getParameter("page") != null) {
            try {
                page = Integer.parseInt(req.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // 페이지 번호가 잘못된 경우 기본값 1
            }
        }

        // 총 페이지 수 계산
        int totalItems = list.size(); //필터로 나온 갯수를 totalItems에 저장 ex)15
        
     // totalItems / ITEMS_PER_PAGE(10) 10을 더블로나눠서 소수까지 출력 ex)1.5 Math.ceil을 통하여 올림 처리 ex) 2페이지 
        int totalPages = (int) Math.ceil(totalItems / (double) ITEMS_PER_PAGE); 
        

        // 페이지에 해당하는 항목 추출 
        int startIndex = (page - 1) * ITEMS_PER_PAGE; //첫페이지 시작 설정 java에서 0~9  
        
     // ex) Math.min 을통하여 startIndex+ITEMS_PER_PAGE , totalItems 둘중 낮은값을 endIndex로 설정 
        int endIndex = Math.min(startIndex + ITEMS_PER_PAGE, totalItems);
        
        // ex) page값이 1이면 pageItems에 subList를 통하여 ( startIndex 0 , endIndex 10); 인덱스0~9값을 담음 1~10
        // ex) 총갯수 15일때 page값이 2가 넘어오면 subList를 통하여 ( startIndex 10 , endIndex 15);
        List<ProductDto> pageItems = list.subList(startIndex, endIndex);
        
        // 요청 속성에 제품 리스트와 카테고리, 페이지 번호, 총 페이지 수 설정
        req.setAttribute("list", pageItems);
        req.setAttribute("page", page);
        req.setAttribute("totalPages", totalPages);

		
		 // 요청 속성에 리스트를 설정
	  //  req.setAttribute("list", list);
	    
	    // JSP 페이지로 포워딩
	    RequestDispatcher dispatcher = req.getRequestDispatcher("/hit.jsp");
	    dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
