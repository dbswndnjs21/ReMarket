<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 보내기</title>
    <link rel="stylesheet" type="text/css" href="css/messages.css">

</head>
<body>
<div class="container">
    <h2>쪽지 보내기</h2>
    <form action="Message.do" method="post">
        <input type="hidden" name="action" value="send">
        <label for="userId">발신자 ID:</label>
        <input type="text" id="userId" name="userId" value="${sessionScope.user_id}" readonly>

        <label for="receiveId">수신자 ID:</label>
        <input type="text" id="receiveId" name="receiveId" required>

        <label for="productId">상품 ID:</label>
        <input type="text" id="productId" name="productId">

        <label for="content">메시지:</label>
        <textarea id="content" name="content" required></textarea>

        <input type="submit" value="보내기">
    </form>
</div>
</body>
</html>
