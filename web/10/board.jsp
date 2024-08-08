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
			<div class="block search-condition">
				<span class="form-Group">
					<select id="searchCondition" class="search-select">
						<option value="">--검색 선택--</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="author">작성자명</option>
					</select>
				</span>
				<span class="form-Group">
					<input type="text" id="searchInput" class="search-input" placeholder="검색어를 입력하세요">
				</span>
				<button type="submit" class="btn Search">검색</button>
				<button type="button" class="btn reset">초기화</button>
			</div>

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
					 	<td><a href ="viewBoard.do?id=${dto.id}">${dto.title}</td>
					 	<td>${dto.userName}</td>
					 	<td>${dto.formattedCreatedAt}</td>
					 	<td>${dto.hit}</td>
					 </tr>
					 </c:forEach>
				</tbody>
			</table>

			<!-- 페이지 버튼 추가 -->
			<div id="boardPagination">
				<a href="#">&laquo; 이전</a> <a href="#">1</a> <a href="#">2</a> <a
					href="#">3</a> <a href="#">4</a> <a href="#">6</a> <a href="#">7</a>
				<a href="#">8</a> <a href="#">9</a> <a href="#">10</a> <a href="#">다음
					&raquo;</a>
			</div>

			<!-- 글쓰기 버튼 -->
			<a href="writeBoard.jsp" class="write-button">글쓰기</a>
		</div>
	</div>
</body>
</html>