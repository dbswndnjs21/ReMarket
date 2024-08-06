<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "인기 상품");
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>인기 상품</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/hit.css">	
</head>
<body>
    <jsp:include page="header.jsp" />
       
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