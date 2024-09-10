<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <style>
        /* 화면 꽉 채우기 */
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            box-sizing: border-box;
        }
        .section {
            width: 100%;
            height: 90%;
            overflow-y: auto;
            box-sizing: border-box;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        .post-list {
            width: 100%;
        }
        .post {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .post:last-child {
            border-bottom: none;
        }
        .post-details {
            margin-bottom: 10px;
        }
        .delete-button {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
    <title>상품 목록</title>
    <link rel="stylesheet" type="text/css" href="css/board.css">    
</head>
<body>
    <div class="container">
        <div class="section">
            <h2>상품 목록</h2>
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
                    <!-- 삭제 버튼 -->
                    <div class="post-actions">
                        <a href="deleteMember.jsp?id=<%= post.get("id") %>" class="delete-button">삭제</a>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>