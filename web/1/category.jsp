<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
            text-align: center;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            background: #333;
            color: #fff;
            padding: 10px 0;
        }

        .nav a {
            color: #fff;
            padding: 0 20px;
            text-decoration: none;
        }

        .nav a:hover {
            background: #575757;
        }

        .category-menu {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .category-menu button {
            background: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            margin: 0 5px;
            cursor: pointer;
        }

        .category-menu button:hover {
            background: #45a049;
        }

        .section {
            background: #fff;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        h2 {
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            color: #4CAF50;
        }

        .post {
            background: #fff;
            margin: 10px 0;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .post-details {
            flex: 1;
        }

        .post h3 {
            margin: 0;
            padding: 0;
        }

        .post p {
            margin: 5px 0 0;
            color: #777;
        }

        .post a {
            text-decoration: none;
            color: #4CAF50;
        }

        .post a:hover {
            text-decoration: underline;
        }

        .post-file {
            margin-left: 20px;
        }

        .post-file img {
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="container">
            <h1>게시판</h1>
        </div>
    </header>

    <nav class="nav">
        <div class="container">
            <a href="main.jsp">홈</a>
            <a href="category.jsp">카테고리</a>
            <a href="hit.jsp">인기 상품</a>
            <a href="new.jsp">최신 상품</a>
            <a href="#">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

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