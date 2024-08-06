<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>보낸 쪽지함</title>
    <link rel="stylesheet" type="text/css" href="css/messages.css">
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            if (status === 'deleted') {
                alert('쪽지가 삭제되었습니다!');
            }
        };
    </script>
</head>
<body>
<div class="container">
    <a href="main.do" class="home-btn">홈</a>
    <a href="message.do?action=view" class="view-messages-btn">수신 쪽지함</a>
    <h2>보낸 쪽지함</h2>
    <c:if test="${not empty messages}">
        <c:forEach var="message" items="${messages}">
            <div class="message-card sent">
                <div class="message-header">
                    <strong>${message.receiveId}</strong>
                    <small class="message-time">
                        <fmt:formatDate value="${message.sendDate}" pattern="yyyy-MM-dd HH:mm"/>
                    </small>
                </div>
                <div class="message-content">
                    <p>${message.content}</p>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
</body>
</html>