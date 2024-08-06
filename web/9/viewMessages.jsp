<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 목록</title>
    <link rel="stylesheet" type="text/css" href="css/messages.css">
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            if (status === 'sent') {
                alert('쪽지가 전송되었습니다!');
            } else if (status === 'deleted') {
                alert('쪽지가 삭제되었습니다!');
            }
        };

        function confirmDelete() {
            return confirm('쪽지를 삭제하시겠습니까?');
        }

        function validateContentLength() {
            const textarea = document.getElementById('content');
            const maxLength = 2000;
            if (textarea.value.length > maxLength) {
                alert(`내용은 ${maxLength}자까지만 입력할 수 있습니다.`);
                textarea.value = textarea.value.substring(0, maxLength);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <a href="main.do" class="home-btn">홈</a>
    <h2>쪽지 목록</h2>
    <a href="sendMessage.jsp" class="send-message-btn">메세지 보내기</a>
    <c:if test="${not empty messages}">
        <c:forEach var="message" items="${messages}">
            <div class="message-card ${message.sendId == sessionScope.user_id ? 'sent' : 'received'}">
                <div class="message-header">
                    <strong>${message.sendId}</strong>
                    <small class="message-time">
                        <fmt:formatDate value="${message.sendDate}" pattern="yyyy-MM-dd HH:mm"/>
                    </small>
                </div>
                <div class="message-content">
                    <p>${message.content}</p>
                </div>
                <div class="message-actions">
                    <form action="sendMessage.jsp" method="get" class="reply-form">
                        <input type="hidden" name="receiveId" value="${message.sendId}">
                        <input type="submit" value="답장" class="reply-button">
                    </form>
                    <form action="message.do" method="post" class="delete-form" onsubmit="return confirmDelete();">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="msgId" value="${message.msgId}">
                        <input type="submit" value="삭제" class="delete-button">
                    </form>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
</body>
</html>
