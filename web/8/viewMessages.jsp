<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 목록</title>
    <link rel="stylesheet" type="text/css" href="css/messages.css">
</head>
<body>
<div class="container">
    <h2>쪽지 목록</h2>

    <c:if test="${not empty messages}">
        <c:forEach var="message" items="${messages}">
            <div class="${message.sendId == sessionScope.user_id ? 'send_id' : 'receive_id'}">
                <div class="message">
                    <strong>${message.sendId}</strong>
                    <span>${message.content}</span><br>
                    <small>${message.sendDate}</small>
                    <form action="Message.do" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="sendId" value="${message.sendId}">
                        <input type="submit" value="삭제">
                    </form>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <a href="sendMessage.jsp">메세지 보내기</a>
</div>
</body>
</html>
