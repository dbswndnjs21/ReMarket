package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import dto.MessageDto;

@WebServlet("/message.do")
public class MessageController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("user_id");

        if (userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        MessageDao dao = new MessageDao();

        if (action == null || "view".equals(action)) {
            List<MessageDto> messages = dao.getMessages(userId);
            req.setAttribute("messages", messages);
            req.getRequestDispatcher("viewMessages.jsp").forward(req, resp);
        } else if ("sent".equals(action)) {
            List<MessageDto> messages = dao.getSentMessages(userId);
            req.setAttribute("messages", messages);
            req.getRequestDispatcher("sentMessages.jsp").forward(req, resp);
        } else if ("send".equals(action)) {
            MessageDto message = new MessageDto();
            message.setUser_id(userId);
            message.setSendId(userId);
            message.setReceiveId(req.getParameter("receiveId"));
            message.setProductName(req.getParameter("productName"));
            message.setContent(req.getParameter("content"));
            message.setMsgStatus(1);
            dao.sendMessage(message);
            resp.sendRedirect("message.do?action=view&status=sent");
        } else if ("delete".equals(action)) {
            int msgId = Integer.parseInt(req.getParameter("msgId"));
            dao.deleteMessage(msgId);
            resp.sendRedirect("message.do?action=view&status=deleted");
        } else if ("reply".equals(action)) {
            String receiveId = req.getParameter("receiveId");
            String productName = req.getParameter("productName");
            req.setAttribute("receiveId", receiveId);
            req.setAttribute("productName", productName);
            req.getRequestDispatcher("sendMessage.jsp").forward(req, resp);
        } else if("read".equals(action)) {
            int msgId = Integer.parseInt(req.getParameter("msgId"));
            dao.readMessage(msgId);
            resp.sendRedirect("message.do?action=view&status=read");
        }else {
            resp.sendRedirect(req.getContextPath() + "/viewMessages.jsp");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
