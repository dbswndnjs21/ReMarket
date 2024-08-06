<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시물 상세 보기</title>
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
						<th colspan="4">${dto.blameTitle}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="light-bg author-cell">신고자명</td>
						<td class="white-bg">${dto.userName}</td>
						<td class="light-bg date-cell">등록일</td>
						<td class="white-bg">${dto.formattedCreatedAt}</td>
					</tr>
					<tr>
						<td class="light-bg view-count-cell">신고유형</td>
						<td colspan="3" class="white-bg">${dto.blameCategory}</td>
					</tr>
					<tr>
						<td colspan="4" class="content-cell">${dto.blameContent}</td>
					</tr>
				</tbody>
			</table>
			<div class="actions">
				<form action="deleteBlame.do" method="post" style="display: inline;">
					<input type="hidden" name= "id" value = "${dto.id}">
					<button type="submit" class="delete-button">삭제</button>
				</form>
			</div>

			<div class="button-container">
				<a href="blameBoard.do">목록</a>
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