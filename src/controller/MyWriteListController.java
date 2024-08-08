package controller;

import dao.MyWriteListDao;
import dao.NotificationDao;
import dao.ProductDao;
import dto.ProductDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/myWriteList.do")
public class MyWriteListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");
        MyWriteListDao dao = new MyWriteListDao();
        ArrayList<ProductDto> productDto = dao.selectList(user_id);
        req.setAttribute("productDto", productDto);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/myWriteList.jsp");
        dispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");
        // 알림에서 들어올실 알림 읽음 표시로 변경 1->2
        NotificationDao updateNotification = new NotificationDao();
        updateNotification.updateStatus(user_id);

        MyWriteListDao dao = new MyWriteListDao();
        ArrayList<ProductDto> productDto = dao.selectList(user_id);
        req.setAttribute("productDto", productDto);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/myWriteList.jsp");
        dispatcher.forward(req, resp);
    }
}
