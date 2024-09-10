<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고 등록성공</title>
    <link rel="stylesheet" type="text/css" href="css/writeBoard.css">
    <script>
        function redirectToMain() {
            window.location.href = "main.do";
        }
    </script>
</head>
<body>
	<jsp:include page="header.jsp" />

    <div class="container">
        <div class="content">
            <h2>신고가 완료되었습니다!</h2>
             <button onclick="redirectToMain()">홈으로 돌아가기</button>
        </div>
    </div>
</body>
</html>