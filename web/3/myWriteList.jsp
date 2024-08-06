<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내가 작성한 글</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/myWriteList.css">	
</head>
<body>
      <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>내가 작성한 글</h1>
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
        <div class="section">
            <h2>내가 작성한 글</h2>
            <%-- 여기에 내가 작성한 글을 표시하는 로직이 들어갑니다. --%>
            <%
                // 내가 작성한 글 목록을 가져오는 로직을 작성해야 합니다.
                // 데이터베이스에서 작성자의 게시물을 조회해야 합니다.
                // 여기에 임시로 예시 데이터를 사용하겠습니다.

                ArrayList<Map<String, String>> myPosts = new ArrayList<>();
                myPosts.add(Map.of("id", "1", "title", "내 글 1", "author", "나", "price", "50,000원", "description", "내가 작성한 첫 번째 글", "file", "myImage1.jpg"));
                myPosts.add(Map.of("id", "2", "title", "내 글 2", "author", "나", "price", "60,000원", "description", "내가 작성한 두 번째 글", "file", "myImage2.jpg"));

                for (Map<String, String> post : myPosts) {
            %>
            <div class="post">
                <div class="post-details">
                    <h3><a href="viewPost.jsp?id=<%= post.get("id") %>"><%= post.get("title") %></a></h3>
                    <p>작성자: <%= post.get("author") %></p>
                    <p>판매금액: <%= post.get("price") %></p>
                    <p><%= post.get("description") %></p>
                </div>
                <div class="post-file">
                    <img src="uploads/<%= post.get("file") %>" alt="첨부파일">
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>