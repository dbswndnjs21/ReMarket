package controller;

import dao.LoginDao;
import dao.SelectUserDao;
import dto.UserDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        String password = req.getParameter("password");

        SelectUserDao selectUserDao = new SelectUserDao();
        UserDto userSelect = selectUserDao.select(user_id);
        String name = userSelect.getName();

        LoginDao dao = new LoginDao();
        boolean result = dao.isMember(user_id,password);
        if (result) {  // 계정 정보와 맞을 경우
            HttpSession session = req.getSession();
            session.setAttribute("user_id",user_id);
            session.setAttribute("name",name);
            resp.sendRedirect(req.getContextPath()+"/main.do");
        } else { // 틀린 경우
            req.setAttribute("msg","로그인 정보가 맞지 않습니다");
            // request 에 setAttribute 담았기 때문에 반드시 forward 방식으로 보내야함
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
