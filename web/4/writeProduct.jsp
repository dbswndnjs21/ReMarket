<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 등록 - 다시마켓</title>
    <link rel="stylesheet" type="text/css" href="css/writeProduct.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>다시마켓</h1>
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
            <a href="writeProduct.jsp">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

    <div class="container">
        <div class="content">
            <h2>제품 등록</h2>
            <div class="form-container">
                <form action="/view/writeProduct/" method="post" enctype="multipart/form-data">
                    <!-- Hidden field to pass user ID -->
                    <input type="hidden" name="userid" value="${sessionScope.userId}">

                    <!-- Product Title -->
                    <label for="product_name">제목</label>
                    <input type="text" id="title" name="product_name" required placeholder="제품 제목을 입력하세요">

                    <!-- Product Description -->
                    <label for="content">내용</label>
                    <textarea id="description" name="content" rows="5" required placeholder="제품 설명을 입력하세요"></textarea>

                    <!-- Product Price -->
                    <label for="price">가격 (₩)</label>
                    <input type="number" id="price" name="price" required placeholder="가격을 입력하세요" step="1000">
					
                    <!-- Category Selection -->
                    <label for="category">카테고리</label>
                    <select id="category" name="category" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="electronics">전자제품</option>
                        <option value="furniture">가구</option>
                        <option value="clothing">의류</option>
                        <option value="books">도서</option>
                    </select>

                    <!-- File Upload -->
                    <label for="file1">첨부파일</label>
                    <input type="file" id="file1" name="file1" accept="image/*">

                    <!-- Submit and Cancel buttons -->
                    <button type="submit">등록</button>
                    <a href="main.jsp" class="cancel-button">취소</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>