package controller;

import dao.WishListDao;
import dto.WishListDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/wishList.do")
public class WishListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");
        WishListDao dao = new WishListDao();
        ArrayList<WishListDto> wishListDto = dao.likeSelect(user_id);

        req.setAttribute("wishListDto",wishListDto);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/wishList.jsp");
        dispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");

        int result;
        HashMap<String, String> likeMap = new HashMap<>();
        likeMap.put("productId", productId);
        likeMap.put("user_id", user_id);
        
        // 중복 체크를 해야겠는데
        WishListDao dao = new WishListDao();
        // true 면 중복된 값
        boolean checkUserId = dao.checkUserID(likeMap);
        if (checkUserId) {
            result = 0;
        } else {
            result = dao.likeInsert(likeMap);
        }

        if (result == 1) {
            req.setAttribute("msg", "찜 성공!");
        } else {
            req.setAttribute("msg", "찜 실패! 중복된 찜인지 확인해 주세요!");
        }
        req.getRequestDispatcher("/viewPost.do").forward(req, resp);
    }
}
