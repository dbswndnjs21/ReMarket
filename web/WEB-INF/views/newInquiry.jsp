<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("headerTitle", "문의하기");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기 - 다시마켓</title>
    <link rel="stylesheet" type="text/css" href="css/newInquiry.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="content">
            <h2>문의하기</h2>
           	<form action="message.do" method="get" class="message-form">
        		<input type="hidden" name="action" value="send">
        		<input type="hidden" name="sendId" value="${sessionScope.user_id}">
        		<input type="hidden" id="receiveId" name="receiveId" value="admin">
        		
        		<label for="receiveId">수신자 ID:</label>
		        <p id="receiveId">운영자</p>

		        <label for="content">내용:</label>
		        <textarea id="content" name="content"></textarea>
		
		        <input type="submit" value="전송">
   			</form>
        </div>
    </div>

</body>
</html>