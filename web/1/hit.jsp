<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>인기 상품</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
            text-align: center;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            background: #333;
            color: #fff;
            padding: 10px 0;
        }

        .nav a {
            color: #fff;
            padding: 0 20px;
            text-decoration: none;
        }

        .nav a:hover {
            background: #575757;
        }

        .section {
            background: #fff;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        h2 {
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            color: #4CAF50;
        }

        .post {
            background: #fff;
            margin: 10px 0;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .post-details {
            flex: 1;
        }

        .post h3 {
            margin: 0;
            padding: 0;
        }

        .post p {
            margin: 5px 0 0;
            color: #777;
        }

        .post a {
            text-decoration: none;
            color: #4CAF50;
        }

        .post a:hover {
            text-decoration: underline;
        }

        .post-file {
            margin-left: 20px;
        }

        .post-file img {
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="container">
            <h1>인기 상품</h1>
        </div>
    </header>

    <nav class="nav">
        <div class="container">
            <a href="main.jsp">홈</a>
            <a href="category.jsp">카테고리</a>
            <a href="hit.jsp">인기 상품</a>
            <a href="new.jsp">최신 상품</a>
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
            <h2>인기 상품</h2>
            <% 
                ArrayList<Map<String, String>> hitPosts = new ArrayList<>();

                // 예시 데이터 추가
                hitPosts.add(Map.of("id", "13", "title", "인기 상품 1", "author", "작성자 13", "price", "130,000원", "description", "인기 상품 1 설명", "file", "image13.jpg"));
                hitPosts.add(Map.of("id", "14", "title", "인기 상품 2", "author", "작성자 14", "price", "140,000원", "description", "인기 상품 2 설명", "file", "image14.jpg"));

                for (Map<String, String> post : hitPosts) {
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
            <% } %>
        </div>
    </div>
</body>
</html>