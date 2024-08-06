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
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header .container {
            display: flex;
            align-items: center;
        }

        .header img.logo {
            margin-right: 15px;
        }

        .header h1 {
            margin: 0;
        }

        .header .icons {
            display: flex;
            align-items: center;
        }

        .header .icons img {
            margin-left: 20px;
            cursor: pointer;
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

        .messages-container {
            background: white;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .message {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .message:last-child {
            border-bottom: none;
        }

        .message-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .message-header .username {
            font-weight: bold;
        }

        .message-content {
            margin: 10px 0;
            line-height: 1.6;
        }

        .reply-container {
            margin-top: 20px;
        }

        .reply-container textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .reply-container input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
        }

        .reply-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
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