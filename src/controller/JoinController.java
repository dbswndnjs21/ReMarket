package controller;

import dao.JoinDao;
import dto.UserDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/join.do")
public class JoinController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("member.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        JoinDao dao = new JoinDao();
        int joinResult = 0;

        if ("CheckId".equals(action)) {
            // 중복 체크 로직
            String user_id = req.getParameter("user_id");
            String idCheckResult = "";

            if (user_id != null && !user_id.trim().isEmpty()) {
                boolean exists = dao.checkUserID(user_id);
                if (exists) {
                    idCheckResult = "사용할 수 없는 아이디입니다.";
                    req.setAttribute("user_id", "");
                    req.setAttribute("idChecked", "false");
                } else {
                    idCheckResult = "사용할 수 있는 아이디입니다.";
                    req.setAttribute("user_id", user_id);
                    req.setAttribute("idChecked", "true");
                }
            } else {
                idCheckResult = "아이디를 입력해주세요.";
                req.setAttribute("idChecked", "false");
            }
            req.setAttribute("idCheckResult", idCheckResult);
            forwardWithFormValues(req, resp); // 폼 값을 유지하면서 포워딩

        } else if ("register".equals(action)) {
            String idChecked = req.getParameter("idChecked");
            if (!"true".equals(idChecked)) {
                req.setAttribute("msg", "아이디 중복 확인을 해주세요.");
                forwardWithFormValues(req, resp);
                return;
            }

            String user_id = req.getParameter("user_id");
            String password = req.getParameter("password");
            String password2 = req.getParameter("password2");

            if (password == null || password.isEmpty() || password2 == null || password2.isEmpty()) {
                req.setAttribute("msg", "비밀번호를 입력해주세요.");
                forwardWithFormValues(req, resp);
                return;
            }

            // pwd2 와 맞지않으면 로그인 페이지로 다시 보내기
            if (!password.equals(password2)) {
                req.setAttribute("passwordCheck", "비밀번호 확인이 맞지않습니다");
                forwardWithFormValues(req, resp);
                return;
            }

            String phone = req.getParameter("phone");
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String birth = req.getParameter("birth");
            String addr = req.getParameter("addr");

            // member.jsp에서 받아온 값 DTO에 넣기
            UserDto dto = new UserDto();
            dto.setUserId(user_id);
            dto.setPassword(password);
            dto.setName(name);
            dto.setEmail(email);
            dto.setPhone(phone);
            dto.setBirth(birth);
            dto.setAddr(addr);
            dto.setGrade(1);

            joinResult = dao.join(dto);
            System.out.println(joinResult);

            if (joinResult == 1) {
                req.setAttribute("msg", "회원가입 완료");
                req.getRequestDispatcher("/main.do").forward(req, resp);
            } else {
                req.setAttribute("msg", "오류로 인한 회원 가입 실패");
                forwardWithFormValues(req, resp);
            }
        }
    }

    private void forwardWithFormValues(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 폼 필드 값을 유지하면서 다시 회원가입 페이지로 포워딩
        req.setAttribute("user_id", req.getParameter("user_id"));
        req.setAttribute("password", req.getParameter("password"));
        req.setAttribute("password2", req.getParameter("password2"));
        req.setAttribute("phone", req.getParameter("phone"));
        req.setAttribute("name", req.getParameter("name"));
        req.setAttribute("email", req.getParameter("email"));
        req.setAttribute("birth", req.getParameter("birth"));
        req.setAttribute("addr", req.getParameter("addr"));
        req.getRequestDispatcher("/member.jsp").forward(req, resp);
    }
}
