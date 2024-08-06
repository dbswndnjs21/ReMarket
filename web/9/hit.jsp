<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>인기 상품</title>
    <link rel="stylesheet" type="text/css" href="css/hit.css">	
</head>
<body>
    <jsp:include page="header.jsp" />
       
    <div class="container">
        <div class="section">
            <h2>인기 상품</h2>
            <c:forEach var="product" items="${list}">
                <div class="post">
                    <div class="post-details">
                        <h3><a href="viewPost.do?productId=${product.productId}">${product.productName}</a></h3>
                        <p>작성자: ${product.user_id}</p>
                        <p>판매금액: ${product.price}</p>
                        <p>조회수: ${product.hit}</p>
                        <p>${product.content}</p>
                    </div>
                    <c:if test="${not empty product.files}">
                        <div class="post-file">
                            <c:forEach var="file" items="${product.files}">
                                <img src="${pageContext.request.contextPath}/upload/${file.saveFileName}" alt="첨부파일" style="width:100px;height:100px;">
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>