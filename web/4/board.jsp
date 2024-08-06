<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자유 게시판</title>
    <link rel="stylesheet" type="text/css" href="css/board.css">    
</head>
<body>
    <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>자유 게시판</h1>
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
            <a href="writeProduct.jsp">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

    <div class="container">
        <div class="section">
            <h2>게시판 목록</h2>
            <div class="post-list">
                <% 
                    ArrayList<Map<String, String>> boardPosts = new ArrayList<>();

                    // 예시 데이터 추가
                    boardPosts.add(Map.of("id", "1", "title", "게시물 1", "author", "작성자 1", "date", "2023-07-25", "file", "image1.jpg"));
                    boardPosts.add(Map.of("id", "2", "title", "게시물 2", "author", "작성자 2", "date", "2023-07-24", "file", "image2.jpg"));

                    for (Map<String, String> post : boardPosts) {
                %>
                <div class="post">
                    <div class="post-details">
                        <h3><a href="viewBoard.jsp?id=<%= post.get("id") %>"><%= post.get("title") %></a></h3>
                        <p>작성자: <%= post.get("author") %></p>
                        <p>작성일: <%= post.get("date") %></p>
                    </div>
                   
                </div>
                <% } %>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="writeBoard.jsp" class="write-button">글쓰기</a>
        </div>
    </div>
</body>
</html>