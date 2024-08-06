<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>최신 상품</title>
    <link rel="stylesheet" type="text/css" href="css/new.css">    
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="section">
            <h2>최신 상품</h2>
            <c:forEach var="product" items="${list}">
                <c:set var="fileSaveName" value="default.jpg" />
                <c:if test="${not empty product.fileDto}">
                    <c:set var="fileSaveName" value="${product.fileDto.saveFileName}" />
                </c:if>
                <div class="post">
                    <div class="post-details">
                        <h3><a href="viewPost.do?productId=${product.productId}">${product.productName}</a></h3>
                        <p>작성자: ${product.user_id}</p>
                        <p>판매금액: ${product.price}</p>
                        <p>등록일자: <fmt:formatDate value="${product.modifyDate}"  pattern="yy-MM-dd HH:mm"/></p>
                        <p>${product.content}</p>
                    </div>
                    <div class="post-file">
                        <img src="${pageContext.request.contextPath}/upload/${fileSaveName}" alt="첨부파일" width="150">
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>