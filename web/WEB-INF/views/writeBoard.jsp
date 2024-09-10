<%@page import="dao.SelectUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "자유 게시판");
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기 - 자유 게시판</title>
    <link rel="stylesheet" type="text/css" href="css/writeBoard.css">
    <script>
        function validateTitle() {
            const titleInput = document.getElementById("title");
            if (titleInput.value.length > 48) {
                alert("제목은 48자 이내로 입력해야 합니다.");
                titleInput.value = titleInput.value.substring(0, 48); // 48자 초과 시 잘라내기
            }
        }
        
        function validateContent() {
            const contentInput = document.getElementById("content");
            const maxLength = 500; // DB에서 정의한 최대 길이
            if (contentInput.value.length > maxLength) {
                alert("내용은 500자 이내로 입력해야 합니다.");
                contentInput.value = contentInput.value.substring(0, maxLength); // 500자 초과 시 잘라내기
            }
        }
        
    </script>
    
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="content">
            <h2>글쓰기</h2>
            
            <div class="form-container">
                <form action="writeBoard.do" method="post">
                    <!-- Hidden field to pass user ID -->
                    <div class="author-container">
                    	<label for="author">작성자</label>
                    	<input type="text" name="userName" value="${dto.name}" readonly="readonly">
                    	<input type="hidden" name ="userId" value="${dto.userId}">
					</div>
                    <!-- Post Title -->
                    	<label for="title">제목</label>
                   	 	<input type="text" id="title" name="title" required placeholder="제목을 입력하세요" maxlength="48" oninput="validateTitle()">
					
                    <!-- Post Content -->
                    <label for="content" >내용</label>
                    <textarea id="content" name="content" rows="10" required placeholder="내용을 입력하세요" oninput="validateContent()"></textarea>
                    <!-- Submit and Cancel buttons -->
                    <button type="submit">등록</button>
                    <a href="board.do" class="cancel-button">취소</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>