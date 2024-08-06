<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "게시물 상세 보기");
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세 보기</title>
    <style>
      
    </style>
    <link rel="stylesheet" type="text/css" href="css/viewBoard.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="post-view">
            <%
                String postId = request.getParameter("id");
                Map<String, Map<String, String>> postData = new HashMap<>();

                // 임시 데이터
                postData.put("1", Map.of("title", "게시물 1", "author", "작성자 1", "date", "2023-07-25", "content", "게시물 1 내용"));
                postData.put("2", Map.of("title", "게시물 2", "author", "작성자 2", "date", "2023-07-24", "content", "게시물 2 내용"));

                Map<String, String> post = postData.get(postId);

                if (post != null) {
            %>
                <h2><%= post.get("title") %></h2>
                <p>작성자: <%= post.get("author") %></p>
                <p>작성일: <%= post.get("date") %></p>
                <p><%= post.get("content") %></p>
                <div class="wishlist-message">
                    <button class="report-button">신고하기</button>
                    <button class="message-button">쪽지 보내기</button>
                </div>
                <div class="actions">
                    <form action="editBoard.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= postId %>">
                        <button type="submit">수정</button>
                    </form>
                    <form action="deleteBoard.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= postId %>">
                        <button type="submit" class="delete-button">삭제</button>
                    </form>
                </div>
                <div class="button-container">
                    <a href="board.jsp">목록</a>
                </div>
            <% } else { %>
                <p>해당 게시물을 찾을 수 없습니다.</p>
            <% } %>
        </div>
    </div>
</body>
</html>