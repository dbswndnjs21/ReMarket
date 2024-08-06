<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기 - 자유 게시판</title>
    <link rel="stylesheet" type="text/css" href="css/writeBoard.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>자유 게시판</h1>
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
            <h2>글쓰기</h2>
            <div class="form-container">
                <form action="/view/writeBoard/" method="post">
                    <!-- Hidden field to pass user ID -->
                    <input type="hidden" name="userid" value="${sessionScope.userId}">

                    <!-- Post Title -->
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" required placeholder="제목을 입력하세요">

                    <!-- Post Content -->
                    <label for="content">내용</label>
                    <textarea id="content" name="content" rows="10" required placeholder="내용을 입력하세요"></textarea>

                    <!-- Submit and Cancel buttons -->
                    <button type="submit">등록</button>
                    <a href="board.jsp" class="cancel-button">취소</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>