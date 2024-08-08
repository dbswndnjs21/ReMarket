<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
<link rel="stylesheet" type="text/css" href="css/viewBoard.css">

</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<!-- 게시물 내용  -->
		<div class="post-view">
			<table class="post-table">
				<thead>
					<tr>
						<th colspan="4">${dto.title}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="light-bg author-cell">작성자명</td>
						<td class="white-bg">${dto.userName}</td>
						<td class="light-bg date-cell">등록일</td>
						<td class="white-bg">${dto.formattedCreatedAt}</td>
					</tr>
					<tr>
						<td class="light-bg view-count-cell">조회수</td>
						<td colspan="3" class="white-bg">${dto.hit}</td>
					</tr>
					<tr>
						<td colspan="4" class="content-cell">${dto.content}</td>
					</tr>
				</tbody>
			</table>
	

			<!-- 댓글 박스: 달려있는 댓글, 댓글 입력창 포함 -->
			<div class = "comment-box">
				<c:forEach var ="commentList" items="${commentList}">
				<div class ="comment-area">
					<div class ="comment-id">
						${commentList.userName} <!-- 아이디 입력 행, 자동으로 받아오기 -->
					</div>
					<div class ="comment-content">
						${commentList.content} <!-- 댓글 내용, 받아오기 --> 
					</div>
					<div class ="comment-date">
						${commentList.formattedCreatedAt} <!-- 댓글 입력 날짜 및 시간, 받아오기 -->
					</div>
				</div>
			</c:forEach>
			
				<!-- 댓글 입력창 -->
				<div class="comment-section">
					<div class="comment-input">
						<c:choose>
							<c:when test = "${not empty userName}">
								<div class="user-id">${userName}</div>
							</c:when>
							<c:otherwise>
								<div class="user-id">${loginMessage}</div>
							</c:otherwise>						
						</c:choose>
						<form action="comment.do" method="post">
							<input type ="hidden" name = "boardId" value ="${dto.id}">
							<input type="hidden" name ="userName" value ="${userName}">
							<textarea placeholder="댓글을 남겨보세요." class="comment-input-field" id="commentInput" name = "commentContent"></textarea>
							<button class="comment-submit-button">댓글 등록</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 신고, 쪽지, 수정, 삭제, 목록 버튼 -->

			<!-- 게시글 작성자 id와 현재 접속 id가 동일할 때 수정 삭제 표현 -->
			<div class="actions">
				<form action="viewBoard.do" method="post" style="display: inline;">
				 <input type="hidden" name="id" value="${dto.id}" />
					<button type="submit">수정</button>
				</form>

				<form action="deleteBoard.do" method="post" style="display: inline;">
					<input type="hidden" name= "id" value = "${dto.id}">
					<button type="submit" class="delete-button">삭제</button>
				</form>
			</div>

<!--  				신고 버튼, 쪽지 보내기 버튼 -> 게시글 작성자id != id 일때 화면에 표시 
			<div class="wishlist-message">
				<button class="report-button">신고하기</button>
				<button class="message-button">쪽지 보내기</button>
			</div>
			
 -->
			<div class="button-container">
				<a href="board.do">목록</a>
			</div>

		</div>
	</div>
	
	
	<!-- TEXTAREA 줄바꿈 시, 텍스트가 아래로 내려가도록 조정하는 코드 -->
<script type="text/javascript">
document.getElementById('commentInput').addEventListener('input', function () {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px';
});

</script>

</body>
</html>