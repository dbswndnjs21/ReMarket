<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "관심 상품");
	%>
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
     <jsp:include page="header.jsp" />

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