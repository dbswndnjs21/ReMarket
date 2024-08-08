<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
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
<title>자유 게시판</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>

<body>
	<!--  헤더 부분  -->
	<jsp:include page="header.jsp" />

	<!-- 컨텐츠 -->
	<div class="container">
		<div class="section">
			<h2>자유게시판</h2>

			<!-- 검색 기능 -->
		<form action="board.do" method="get" class = "block search-condition">
				<span class="form-Group"> 
				<select id="searchCondition" name="condition" class="search-select">
						<option value="">--검색 선택--</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
				</select>
				</span> 
				<span class="form-Group"> 
					<input type="text" id="searchInput" name="keyword" class="search-input" placeholder="검색어를 입력하세요">
				</span>
				<button type="submit" class="btn Search">검색</button>
				<button type="button" class="btn reset">초기화</button>
			</form>

			<table class="column">
				<tr>
					<th class="table-header">순번</th>
					<th class="table-header">제목</th>
					<th class="table-header">작성자명</th>
					<th class="table-header">등록일</th>
					<th class="table-header">조회수</th>
				</tr>
				<tbody>
					<c:forEach var="dto" items="${requestScope.lists}">
						<tr>
							<td>${dto.id}</td>
							<td><a href="viewBoard.do?id=${dto.id}">${dto.title}</a></td>
							<td>${dto.userName}</td>
							<td>${dto.formattedCreatedAt}</td>
							<td>${dto.hit}</td>
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

			<!-- 글쓰기 버튼 -->
			<a href="writeBoard.do" class="write-button">글쓰기</a>
		</div>
	</div>
</body>
</html>