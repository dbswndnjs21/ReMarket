<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>게시물 상세 보기</h1>
        </div>
        <div class="icons">
            <a href="messages.jsp">
                <img src="images/belloff.svg" alt="메시지 아이콘" width="30">
            </a>
            <a href="alram.jsp">
                <img src="images/belloff1.svg" alt="알림 벨 아이콘" width="30">
            </a>
        </div>
    </header>

    <nav class="nav">
        <div class="container">
            <a href="main.jsp">홈</a>
            <a href="category.jsp">카테고리</a>
            <a href="hit.jsp">인기 상품</a>
            <a href="new.jsp">최신 상품</a>
            <a href="board.jsp">자유 게시판</a>
            <a href="#">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

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