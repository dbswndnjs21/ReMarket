package controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SelectUserDao;
import dto.UserDto;

@WebServlet("/userList.do")
public class UserListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SelectUserDao userDao = new SelectUserDao();
        List<UserDto> userList = userDao.selectAll();
        
        // 유저 목록을 요청 속성에 저장
        request.setAttribute("lists", userList);
        
        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/userList.jsp").forward(request, response);
    }
	
	
}

