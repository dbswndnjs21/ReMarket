<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "카테고리");
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <style>

    </style>
    <link rel="stylesheet" type="text/css" href="css/category.css">	
</head>
<body>
   <jsp:include page="header.jsp" />
   
    <div class="container">
        <!-- 카테고리 선택 버튼 -->
        <div class="category-menu">
            <a href="category.jsp?category=all"><button>전체</button></a>
            <a href="category.jsp?category=electronics"><button>전자제품</button></a>
            <a href="category.jsp?category=furniture"><button>가구</button></a>
            <a href="category.jsp?category=clothing"><button>의류</button></a>
            <a href="category.jsp?category=books"><button>도서</button></a>
        </div>

        <%
            String category = request.getParameter("category");
            if (category == null) {
                category = "all";
            }

            String categoryTitle;
            switch (category) {
                case "electronics":
                    categoryTitle = "전자제품";
                    break;
                case "furniture":
                    categoryTitle = "가구";
                    break;
                case "clothing":
                    categoryTitle = "의류";
                    break;
                case "books":
                    categoryTitle = "도서";
                    break;
                default:
                    categoryTitle = "전체 게시물";
                    break;
            }
        %>
        <div class="section">
            <h2><%= categoryTitle %></h2>

            <% 
                // 게시물 목록을 가져오는 로직을 작성해야 합니다.
                // 데이터베이스에서 카테고리에 해당하는 게시물을 조회해야 합니다.
                // 여기에 임시로 예시 데이터를 사용하겠습니다.

                ArrayList<Map<String, String>> posts = new ArrayList<>();

                if ("electronics".equals(category)) {
                    posts.add(Map.of("id", "1", "title", "전자제품 게시물 1", "author", "작성자 1", "price", "100,000원", "description", "전자제품 게시물 1 설명", "file", "image1.jpg"));
                    posts.add(Map.of("id", "2", "title", "전자제품 게시물 2", "author", "작성자 2", "price", "200,000원", "description", "전자제품 게시물 2 설명", "file", "image2.jpg"));
                } else if ("furniture".equals(category)) {
                    posts.add(Map.of("id", "3", "title", "가구 게시물 1", "author", "작성자 3", "price", "300,000원", "description", "가구 게시물 1 설명", "file", "image3.jpg"));
                    posts.add(Map.of("id", "4", "title", "가구 게시물 2", "author", "작성자 4", "price", "400,000원", "description", "가구 게시물 2 설명", "file", "image4.jpg"));
                } else if ("clothing".equals(category)) {
                    posts.add(Map.of("id", "5", "title", "의류 게시물 1", "author", "작성자 5", "price", "50,000원", "description", "의류 게시물 1 설명", "file", "image5.jpg"));
                    posts.add(Map.of("id", "6", "title", "의류 게시물 2", "author", "작성자 6", "price", "60,000원", "description", "의류 게시물 2 설명", "file", "image6.jpg"));
                } else if ("books".equals(category)) {
                    posts.add(Map.of("id", "7", "title", "도서 게시물 1", "author", "작성자 7", "price", "10,000원", "description", "도서 게시물 1 설명", "file", "image7.jpg"));
                    posts.add(Map.of("id", "8", "title", "도서 게시물 2", "author", "작성자 8", "price", "20,000원", "description", "도서 게시물 2 설명", "file", "image8.jpg"));
                } else {
                    posts.add(Map.of("id", "9", "title", "전체 게시물 1", "author", "작성자 9", "price", "90,000원", "description", "전체 게시물 1 설명", "file", "image9.jpg"));
                    posts.add(Map.of("id", "10", "title", "전체 게시물 2", "author", "작성자 10", "price", "80,000원", "description", "전체 게시물 2 설명", "file", "image10.jpg"));
                }

                for (Map<String, String> post : posts) {
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
            <%
                }
            %>
        </div>
    </div>
</body>
</html>