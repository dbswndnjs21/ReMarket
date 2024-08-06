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

        .post-view {
            background: #fff;
            margin: 20px 0;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .post-view h2 {
            margin: 0 0 10px;
        }

        .post-view p {
            margin: 5px 0;
            color: #777;
        }

        .post-view img {
            max-width: 100%;
            margin-top: 20px;
        }

        .post-view .wishlist-message {
            display: flex;
            position: absolute;
            top: 20px;
            right: 20px;
            gap: 10px;
        }

        .post-view .wishlist-message .report-button {
            background-color: #f44336; /* 빨간색 */
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        .post-view .wishlist-message .report-button:hover {
            background-color: #d32f2f; /* 조금 더 어두운 빨간색 */
        }

        .post-view .wishlist-message .add-to-wishlist {
            background-color: #FFC107; /* 노란색 */
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        .post-view .wishlist-message .add-to-wishlist:hover {
            background-color: #ffca28; /* 조금 더 어두운 노란색 */
        }

        .post-view .wishlist-message .message-button {
            background-color: #2196F3; /* 파란색 */
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        .post-view .wishlist-message .message-button:hover {
            background-color: #1976D2; /* 조금 더 어두운 파란색 */
        }

        .post-view .actions {
            position: absolute;
            bottom: 20px;
            right: 20px;
        }

        .post-view .actions button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 4px;
        }

        .post-view .actions button:hover {
            background-color: #45a049;
        }

        .post-view .actions .delete-button {
            background-color: #f44336;
        }

        .post-view .actions .delete-button:hover {
            background-color: #e53935;
        }
    </style>
    	
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
        <%
            String postId = request.getParameter("id");
            Map<String, Map<String, String>> postData = new HashMap<>();

            // 임시 데이터. 실제로는 데이터베이스에서 조회한 데이터를 사용해야 합니다.
            postData.put("1", Map.of("title", "전자제품 게시물 1", "author", "작성자 1", "price", "100,000원", "content", "전자제품 게시물 1 내용", "file", "image1.jpg"));
            postData.put("2", Map.of("title", "전자제품 게시물 2", "author", "작성자 2", "price", "200,000원", "content", "전자제품 게시물 2 내용", "file", "image2.jpg"));
            postData.put("3", Map.of("title", "가구 게시물 1", "author", "작성자 3", "price", "300,000원", "content", "가구 게시물 1 내용", "file", "image3.jpg"));
            postData.put("4", Map.of("title", "가구 게시물 2", "author", "작성자 4", "price", "400,000원", "content", "가구 게시물 2 내용", "file", "image4.jpg"));
            postData.put("5", Map.of("title", "의류 게시물 1", "author", "작성자 5", "price", "50,000원", "content", "의류 게시물 1 내용", "file", "image5.jpg"));
            postData.put("6", Map.of("title", "의류 게시물 2", "author", "작성자 6", "price", "60,000원", "content", "의류 게시물 2 내용", "file", "image6.jpg"));
            postData.put("7", Map.of("title", "도서 게시물 1", "author", "작성자 7", "price", "10,000원", "content", "도서 게시물 1 내용", "file", "image7.jpg"));
            postData.put("8", Map.of("title", "도서 게시물 2", "author", "작성자 8", "price", "20,000원", "content", "도서 게시물 2 내용", "file", "image8.jpg"));
            postData.put("9", Map.of("title", "전체 게시물 1", "author", "작성자 9", "price", "90,000원", "content", "전체 게시물 1 내용", "file", "image9.jpg"));
            postData.put("10", Map.of("title", "전체 게시물 2", "author", "작성자 10", "price", "80,000원", "content", "전체 게시물 2 내용", "file", "image10.jpg"));

            Map<String, String> post = postData.get(postId);

            if (post != null) {
        %>
            <div class="post-view">
                <div class="wishlist-message">
                    <button class="report-button">신고하기</button>
                    <button class="add-to-wishlist">관심 상품에 추가</button>
                    <button class="message-button">쪽지 보내기</button>
                </div>
                <h2><%= post.get("title") %></h2>
                <p>작성자: <%= post.get("author") %></p>
                <p>판매금액: <%= post.get("price") %></p>
                <p><%= post.get("content") %></p>
                <img src="uploads/<%= post.get("file") %>" alt="첨부파일">
                <div class="actions">
                    <form action="editPost.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= postId %>">
                        <button type="submit">수정</button>
                    </form>
                    <form action="deletePost.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= postId %>">
                        <button type="submit" class="delete-button">삭제</button>
                    </form>
                </div>
            </div>
        <% } else { %>
            <p>해당 게시물을 찾을 수 없습니다.</p>
        <% } %>
    </div>
</body>
</html>