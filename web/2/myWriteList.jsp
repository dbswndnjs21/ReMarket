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
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header .container {
            display: flex;
            align-items: center;
        }

        .header img.logo {
            margin-right: 15px;
        }

        .header h1 {
            margin: 0;
        }

        .header .icons {
            display: flex;
            align-items: center;
        }

        .header .icons img {
            margin-left: 20px;
            cursor: pointer;
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

        .item {
            background: #fff;
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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