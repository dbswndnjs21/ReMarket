<%@page import="dao.BlameDao"%>
<%@page import="dto.BlameDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>신고 게시판</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>

<body>
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="section">
			<h2>신고 목록</h2>

			<!-- 검색 기능 -->
			<form action="blameBoard.do" method="get" class = "block search-condition">
				
				
				<button type="submit" class="btn Search">처리 미완료 신고글 조회</button>
				
			</form>

			<table class="column">
				<tr>
					<th class="table-header">순번</th>
					<th class="table-header">유형</th>
					<th class="table-header">제목</th>
					<th class="table-header">신고자명</th>
					<th class="table-header">등록일</th>
					<th class="table-header">처리하기</th>
				</tr>
				<tbody>
					 <c:forEach var="dto" items="${requestScope.lists}">
					 <tr>
					 	<td>${dto.blameId}</td>
					 	<td>${dto.blameCategory}</td>
					 	<td><a href ="viewBlame.do?blameId=${dto.blameId}">${dto.blameTitle}</td>
					 	<td>${dto.userName}</td>
					 	<td>${dto.createdAt}</td>
					 	<td>
					 		<form action="completeBlame.do" method="post">
					 			<input type="hidden" name="id" value="${dto.blameId}">
					 			<input type="hidden" name="userName" value="${dto.userName}">
					 			<button type="submit" class="complete-button">처리하기</button>
					 			<button type="submit" class="refuse-button">처리거부</button>
					 		</form>
					 	</td>
					 </tr>
					 </c:forEach>
				</tbody>
			</table>

			<!-- 페이지 버튼 추가 -->
			<div id="boardPagination">
				<c:if test="${currentPage > 1}">
					<a href="?page=1">&laquo; 처음</a>
					<a href="?page=${currentPage - 1}">&lt; 이전</a>
				</c:if>

				<c:forEach var="i" begin="1" end="${totalsPages}">
					<c:choose>
						<c:when test="${i == currentPage}">
							<span>${i}</span>
						</c:when>
						<c:otherwise>
							<a href="?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage < totalsPages}">
					<a href="?page=${currentPage + 1}">다음 &gt;</a>
					<a href="?page=${totalsPages}">마지막 &raquo;</a>
				</c:if>

			</div>
		</div>
	</div>
</body>
</html>
