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
				<span class="form-Group">
					<select id="searchCondition" class="search-select">
						<option value="">--검색 선택--</option>
						<option value="blameTitle">제목</option>
						<option value="blameContent">내용</option>
						<option value="name">신고자명</option>
					</select>
				</span>
				<span class="form-Group">
    				<input type="text" name="keyword" id="searchInput" class="search-input" placeholder="검색어를 입력하세요">
				</span>
				<button type="submit" class="btn Search">검색</button>
				<button type="button" class="btn reset" onclick="window.location.href='blameBoard.do'">초기화</button>
			</form>

			<table class="column">
				<tr>
					<th class="table-header">순번</th>
					<th class="table-header">유형</th>
					<th class="table-header">제목</th>
					<th class="table-header">신고자명</th>
					<th class="table-header">등록일</th>
					<th class="table-header">처리완료</th>
				</tr>
				<tbody>
					 <c:forEach var="dto" items="${requestScope.lists}">
					 <tr>
					 	<td>${dto.blameId}</td>
					 	<td>${dto.blameCategory}</td>
					 	<td><a href ="viewBlame.do?id=${dto.blameId}">${dto.blameTitle}</td>
					 	<td>${dto.userName}</td>
					 	<td>${dto.createdAt}</td>
					 	<td>
					 		<form action="completeBlame.do" method="post">
					 			<input type="hidden" name="id" value="${dto.blameId}">
					 			<input type="hidden" name="userName" value="${dto.userName}">
					 			<button type="submit" class="complete-button">처리완료</button>
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
