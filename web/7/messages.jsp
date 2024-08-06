<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "쪽지 보내기");
	%>
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
    <jsp:include page="header.jsp" />
    
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