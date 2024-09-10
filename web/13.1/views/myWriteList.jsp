<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dto.ProductDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%
    request.setAttribute("headerTitle", "내가 작성한 글");
   %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내가 작성한 글</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/myWriteList.css">   
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="section">
            <h2>내가 작성한 글</h2>
            <%-- 여기에 내가 작성한 글을 표시하는 로직이 들어갑니다. --%>
            <c:forEach var="product" items="${productDto}">
                <div class="post">
                    <div class="post-details">
                        <h3><a href="viewPost.do?productId=${product.productId}">${product.productName}</a></h3>
                        <p>작성자: ${product.user_id}</p>
                        <p>판매금액: ${product.price}</p>
                        <p>${product.content}</p>
                    </div>
                    <c:if test="${not empty product.fileDto}">
                        <div class="post-file">
<%--                            <c:forEach var="file" items="${product.fileDto}">--%>
                            <img src="${pageContext.request.contextPath}/upload/${product.fileDto.saveFileName}" alt="첨부파일" style="width:100px;height:100px;">
<%--                            </c:forEach>--%>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>