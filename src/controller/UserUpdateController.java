package controller;

import dao.UpdateDao;
import dto.UserDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/update.do")
public class UserUpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");


        UpdateDao dao = new UpdateDao();
        UserDto select = dao.select(user_id);

        req.setAttribute("select", select);
        req.getRequestDispatcher("/WEB-INF/views/editProfile.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String user_id = req.getParameter("user_id");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String name = req.getParameter("name");
        String birth = req.getParameter("birth");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String addr = req.getParameter("addr");

        // 비밀번호와 비밀번호 확인이 일치하는지 확인
        if (!password.equals(confirmPassword)) {
            req.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
            req.setAttribute("select", new UserDto(user_id, name, email, phone, addr, birth)); // 입력한 값을 유지
            req.getRequestDispatcher("/WEB-INF/views/editProfile.jsp").forward(req, resp);
            return;
        }
        
        UpdateDao dao = new UpdateDao();
        UserDto user  = new UserDto();
        user.setUserId(user_id);
        user.setName(name);
        user.setPassword(password);
        user.setBirth(birth);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddr(addr);

        int result = dao.update(user);

        if (result == 1) {
            req.setAttribute("msg", "회원정보 수정 완료");
            req.setAttribute("userDto", user);
        } else {
            req.setAttribute("msg", "오류로 인한 정보 수정 실패");
            req.setAttribute("userDto", user);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/mypage.jsp");
        rd.forward(req, resp);
    }
}
