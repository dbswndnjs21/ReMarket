<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>검색 결과 - 다시마켓</title>
    <link rel="stylesheet" type="text/css" href="css/searchProduct.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <div class="section">
            <h2>검색 결과</h2>
            <c:if test="${not empty list}">
                <div class="items-grid">
                    <c:forEach var="item" items="${list}">
                        <div class="post">
                            <div class="post-details">
                                <h3><a href="viewPost.do?productId=${item.productId}">${item.productName}</a></h3>
                                <p>가격: ${item.price}</p>
                                <p>작성자: ${item.user_id}</p>
                                <p>작성일: <fmt:formatDate value="${item.modifyDate}" pattern="yy-MM-dd HH:mm"/></p>
                            </div>
                            <c:if test="${item.files != null }">
                                <div class="post-file">
                                    <img src="${pageContext.request.contextPath}/upload/${item.fileDto.saveFileName}" alt="${item.productName}">
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty list}">
                <p>검색 결과가 없습니다.</p>
            </c:if>
        </div>
    </div>
</body>
</html>