<%@page import="java.util.List"%>
<%@page import="dto.ProductDto"%>
<%@page import="dto.FileDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("headerTitle", "내가 작성한 글");
    List<ProductDto> products = (List<ProductDto>) request.getAttribute("products");
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
        <%
            if (products != null) {
                for (ProductDto product : products) {
        %>
        <div class="post">
            <div class="post-details">
                <h3><a href="viewPost.do?productId=<%= product.getProductId() %>"><%= product.getProductName() %></a></h3>
                <p>작성자: <%= product.getUser_id()%></p>
                <p>판매금액: <%= product.getPrice() %></p>
                <p><%= product.getContent() %></p>
            </div>
            <%
                List<FileDto> files = product.getFiles();
                if (files != null && !files.isEmpty()) {
            %>
            <div class="post-file">
                <%
                    for (FileDto file : files) {
                %>
                <img src="<%= request.getContextPath() %>/upload/<%= file.getSaveFileName() %>" alt="첨부파일" style="width:100px;height:100px;">
                <%
                    }
                %>
            </div>
            <%
                }
            %>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
