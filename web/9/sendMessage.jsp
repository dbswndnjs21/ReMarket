<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 보내기</title>
    <link rel="stylesheet" type="text/css" href="css/messages.css">
    <script>
        // 최대 글자 수
        const maxContentLength = 500;

        // 입력된 내용의 길이를 검증하는 함수
        function validateContentLength() {
            const content = document.getElementById('content');
            const contentLength = content.value.length;
            if (contentLength > maxContentLength) {
                alert(`내용은 최대 500자까지 쓸 수 있습니다.`);
                content.value = content.value.substring(0, maxContentLength);
            }
        }

        // 입력 필드에 이벤트 리스너 추가
        window.onload = function() {
            const contentField = document.getElementById('content');
            contentField.addEventListener('input', validateContentLength);
        };
    </script>
</head>
<body>
<div class="container">
    <h2>쪽지 보내기</h2>
    <form action="message.do" method="post" class="message-form">
        <input type="hidden" name="action" value="send">
        <input type="hidden" name="sendId" value="${sessionScope.user_id}"> <!-- 발신자 ID는 hidden 필드로 설정 -->

        <label for="receiveId">수신자 ID:</label>
        <input type="text" id="receiveId" name="receiveId" value="${param.receiveId}" readonly>

        <label for="productId">제품 ID:</label>
        <input type="text" id="productId" name="productId">

        <label for="content">내용:</label>
        <textarea id="content" name="content"></textarea>

        <input type="submit" value="전송">
    </form>
    <a href="message.do?action=view" class="back-btn">쪽지 목록으로 돌아가기</a>
</div>
</body>
</html>
