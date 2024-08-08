<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "구매 내역");
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매 내역</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/orderList.css">	
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="section">
            <h2>구매 내역</h2>
            <%-- 여기에 구매 내역을 표시하는 로직이 들어갑니다. --%>
            <%
                // 구매 내역 목록을 가져오는 로직을 작성해야 합니다.
                // 데이터베이스에서 구매 내역을 조회해야 합니다.
                // 여기에 임시로 예시 데이터를 사용하겠습니다.

                ArrayList<Map<String, String>> orders = new ArrayList<>();
                orders.add(Map.of("id", "1", "title", "노트북", "author", "판매자1", "price", "₩1,200,000", "description", "고성능 노트북입니다.", "file", "orderImage1.jpg"));
                orders.add(Map.of("id", "2", "title", "스마트폰", "author", "판매자2", "price", "₩800,000", "description", "최신 스마트폰입니다.", "file", "orderImage2.jpg"));

                for (Map<String, String> order : orders) {
            %>
            <div class="post">
                <div class="post-details">
                    <h3><a href="viewPost.jsp??id=<%= order.get("id") %>"><%= order.get("title") %></a></h3>
                    <p>작성자: <%= order.get("author") %></p>
                    <p>판매금액: <%= order.get("price") %></p>
                    <p><%= order.get("description") %></p>
                </div>
                <div class="post-file">
                    <img src="uploads/<%= order.get("file") %>" alt="첨부파일">
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>