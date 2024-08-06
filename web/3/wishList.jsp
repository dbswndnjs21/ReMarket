
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관심 상품</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/wishList.css">	
</head>
<body>
     <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>관심 상품</h1>
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
            <h2>관심 상품</h2>
            <%-- 여기에 관심 상품 목록을 표시하는 로직이 들어갑니다. --%>
            <%
                // 관심 상품 목록을 가져오는 로직을 작성해야 합니다.
                // 데이터베이스에서 사용자가 관심 있는 상품을 조회해야 합니다.
                // 여기에 임시로 예시 데이터를 사용하겠습니다.

                ArrayList<Map<String, String>> wishList = new ArrayList<>();
                wishList.add(Map.of("id", "1", "title", "태블릿", "author", "판매자1", "price", "₩300,000", "description", "최고의 태블릿입니다.", "file", "tablet.jpg"));
                wishList.add(Map.of("id", "2", "title", "헤드폰", "author", "판매자2", "price", "₩100,000", "description", "고음질의 헤드폰입니다.", "file", "headphone.jpg"));

                for (Map<String, String> item : wishList) {
            %>
            <div class="post">
                <div class="post-details">
                    <h3><a href="viewPost.jsp??id=<%= item.get("id") %>"><%= item.get("title") %></a></h3>
                    <p>작성자: <%= item.get("author") %></p>
                    <p>판매금액: <%= item.get("price") %></p>
                    <p><%= item.get("description") %></p>
                </div>
                <div class="post-file">
                    <img src="uploads/<%= item.get("file") %>" alt="상품 이미지">
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>