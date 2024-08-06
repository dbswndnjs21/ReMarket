package controller;

import dao.MyPageDao;
import dto.UserDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/mypage.do")
public class MyPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = (String) req.getSession().getAttribute("user_id");

        MyPageDao dao = new MyPageDao();
        UserDto userDto = dao.select(user_id);
        req.setAttribute("userDto", userDto);
        req.getRequestDispatcher("/mypage.jsp").forward(req, resp);
    }
}
