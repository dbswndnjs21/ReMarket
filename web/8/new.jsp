<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "최신 상품");
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>최신 상품</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/new.css">	
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="section">
            <h2>최신 상품</h2>
            <% 
                ArrayList<Map<String, String>> newPosts = new ArrayList<>();

                // 예시 데이터 추가
                newPosts.add(Map.of("id", "11", "title", "최신 상품 1", "author", "작성자 11", "price", "110,000원", "description", "최신 상품 1 설명", "file", "image11.jpg"));
                newPosts.add(Map.of("id", "12", "title", "최신 상품 2", "author", "작성자 12", "price", "120,000원", "description", "최신 상품 2 설명", "file", "image12.jpg"));

                for (Map<String, String> post : newPosts) {
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