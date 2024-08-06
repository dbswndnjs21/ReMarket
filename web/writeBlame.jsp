<%@page import="dao.SelectUserDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "신고하기");
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고하기</title>
    <link rel="stylesheet" type="text/css" href="css/writeBoard.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="content">
            <h2>신고하기</h2>
            
            <div class="form-container">
                <form action="writeBlame.do" method="post">
                    
                    <div class="author-container">
                    	<label for="author">신고자 ID</label>
                    	<input type="text" name="userId" value="${sessionScope.user_id}" readonly="readonly">
					</div>
					
					<!-- 신고버튼을 누를 게시물의 작성자와 제목 -->
					<div class="post-info">
                        <label for="postAuthor">해당신고 물품 작성자 ID</label>
                        <input type="text" id="postAuthor" name="postAuthor" value="${author}" readonly="readonly">
                        
                        <label for="postTitle">해당신고 물품 게시물 제목</label>
                        <input type="text" id="postTitle" name="postTitle" value="${postTitle}" readonly="readonly">
                        
                    </div>
					
                    <!-- Blame Title -->
                    <label for="title">신고제목</label>
                   	<input type="text" id="title" name="title" required placeholder="제목을 입력하세요">
					
					<!-- Blame Category -->
                    <label for="category">신고유형</label>
                    <select id="blameCategory" name="blameCategory" required>
                        <option value="">신고유형선택</option>
                        <option value="spam">스팸홍보/도배글</option>
                        <option value="illegal">불법 및 사기정보를 포함</option>
                        <option value="pornography">음란물</option>
                        <option value="privacy">개인정보 노출 게시</option>
                        <option value="torment">욕설, 혐오, 차별적 표현 등의 괴롭히는 언어사용</option>
                    </select>
					
                    <!-- Blame Content -->
                    <label for="content">신고내용</label>
                    <textarea id="content" name="content" rows="10" required placeholder="내용을 입력하세요" maxlength="100"></textarea>
					<script>
   					document.getElementById('content').addEventListener('input', function() {
        				var textarea = this;
        				if (textarea.value.length > 100) {
           					alert("100자 이내로 작성해주세요.");
            				textarea.value = textarea.value.substring(0, 100);
       					}
   					});
    				</script>
					
                    <!-- Submit and Cancel buttons -->
                    <button type="submit">등록</button>
                    <a href="javascript:history.back()" class="cancel-button">취소</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>