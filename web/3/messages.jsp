<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메시지 - 다시마켓</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/messages.css">	
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
            <a href="#">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

    <div class="container">
        <div class="messages-container">
            <div class="message">
                <div class="message-header">
                    <span class="username">상대방 아이디</span>
                    <span class="timestamp">2024-07-25 14:00</span>
                </div>
                <div class="message-content">
                    <p>안녕하세요, 이 상품에 대해 궁금한 점이 있습니다.</p>
                </div>
            </div>
            <div class="message">
                <div class="message-header">
                    <span class="username">내 아이디</span>
                    <span class="timestamp">2024-07-25 14:05</span>
                </div>
                <div class="message-content">
                    <p>안녕하세요! 어떤 점이 궁금하신가요?</p>
                </div>
            </div>
            <!-- 추가적인 메시지 -->
        </div>

        <div class="reply-container">
            <form action="sendMessage.jsp" method="post">
                <textarea name="replyMessage" placeholder="메시지를 입력하세요..."></textarea>
                <input type="submit" value="답장 보내기">
            </form>
        </div>
    </div>
</body>
</html>