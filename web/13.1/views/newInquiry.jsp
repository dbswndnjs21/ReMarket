<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // headerTitle을 설정하여 헤더에 표시될 제목을 지정
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
            <form action="submitInquiry.do" method="post">
                <div class="form-container">
                    <label for="inquiryTitle">제목</label>
                    <input type="text" id="inquiryTitle" name="inquiryTitle" required>
                    <label for="inquiryContent">문의 내용</label>
                    <textarea id="inquiryContent" name="inquiryContent" rows="10" required></textarea>
                    <button type="submit">문의 제출</button>
                    <a href="cancelLink" class="cancel-button">취소</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>