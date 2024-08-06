<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수신 쪽지함</title>
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
    </script>
</head>
<body>
<div class="container">
    <a href="main.do" class="home-btn">홈</a>
    <a href="message.do?action=sent" class="sent-messages-btn">보낸 쪽지함</a>
    <h2>수신 쪽지함</h2>
    <c:if test="${not empty messages}">
        <c:forEach var="message" items="${messages}">
            <div class="message-card received">
                <div class="message-header">
                    <strong>${message.sendId}</strong>
                    <small class="message-time">
                        <fmt:formatDate value="${message.sendDate}" pattern="yyyy-MM-dd HH:mm"/>
                    </small>
                </div>
                <div class="message-content">
                    <p><strong>상품명: [${message.productName}]</strong></p>
                    <p>${message.content}</p>
                </div>
                <div class="message-actions">
                    <form action="message.do" method="post" class="reply-form">
                        <input type="hidden" name="action" value="reply">
                        <input type="hidden" name="receiveId" value="${message.sendId}">
                        <input type="hidden" name="productName" value="${message.productName}">
                        <input type="submit" value="답장" class="reply-button">
                    </form>
                    <form action="message.do" method="post" class="read-form">
                        <input type="hidden" name="action" value="read">
                        <input type="hidden" name="msgId" value="${message.msgId}">
                        <input type="submit" value="읽음" class="read-button">
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
