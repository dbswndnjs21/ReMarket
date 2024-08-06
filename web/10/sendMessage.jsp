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
        const maxContentLength = 1000;

        // 입력된 내용의 길이를 검증하는 함수
        function validateContentLength() {
            const content = document.getElementById('content');
            const contentLength = content.value.length;
            if (contentLength > maxContentLength) {
                alert(`내용은 최대 1000자까지 쓸 수 있습니다.`);
                content.value = content.value.substring(0, maxContentLength);
            }
        }

        // 텍스트 영역의 높이를 자동으로 조정하는 함수
        function autoResizeTextarea() {
            const textarea = document.getElementById('content');
            textarea.style.height = '150px'; // 초기 높이를 설정합니다.
            if (textarea.scrollHeight > textarea.clientHeight) {
                textarea.style.height = (textarea.scrollHeight) + 'px';
            }
        }

        // 입력 필드에 이벤트 리스너 추가
        window.onload = function() {
            const contentField = document.getElementById('content');
            contentField.addEventListener('input', validateContentLength);
            contentField.addEventListener('input', autoResizeTextarea);
        };
    </script>
</head>
<body>
<div class="container">
    <h2>쪽지 보내기</h2>
    <form action="message.do" method="post" class="message-form">
        <input type="hidden" name="action" value="send">
        <input type="hidden" name="sendId" value="${sessionScope.user_id}">
        <input type="text" name="receiveId" value="${receiveId}" readonly> <!-- 수신자 ID는 hidden 필드로 설정 -->

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
