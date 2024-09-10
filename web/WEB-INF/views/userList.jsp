<%@page import="dao.SelectUserDao"%>
<%@page import="dto.UserDto"%>
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
<title>유저 목록</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>

<body>
	<!-- 컨텐츠 -->
	<div class="container">
		<div class="section">
			<h2>유저 목록</h2>

			<!-- 검색 기능 -->
			<form action="userList.do" method="get" class = "block search-condition">
				<button type="submit" class="btn Search">유저 전체 조회</button>
			</form>

			<table class="column">
				<tr>
					<th class="table-header">아이디</th>
					<th class="table-header">이름</th>
					<th class="table-header">이메일</th>
					<th class="table-header">가입일</th>
					<th class="table-header">계정상태</th>					
				</tr>
				<tbody>
					 <c:forEach var="dto" items="${requestScope.lists}">
					 <tr>
					 	<td>${dto.userId}</td>
					 	<td>${dto.name}</td>
					 	<!--  <td><a href ="???.do?pCode=${dto.pCode}">${dto.name}</a></td> 계정 상세보기가 필요한 경우?--> 
					 	<td>${dto.email}</td>
					 	<td>${dto.joinDate}</td>
					 	<td> <!-- 아직 컨트롤러 생성 안함 -->
					 		<form action="changeUser.do" method="post">
                                    <input type="hidden" name="pCode" value="${dto.pCode}">
                                    <button type="submit" name="action" value="stop" class="stop-button">계정정지</button>
                                    <button type="submit" name="action" value="recovery" class="recovery-button">계정복구</button>
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

				<c:forEach var="i" begin="1" end="${totalPages}">
					<c:choose>
						<c:when test="${i == currentPage}">
							<span>${i}</span>
						</c:when>
						<c:otherwise>
							<a href="?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${currentPage < totalPages}">
					<a href="?page=${currentPage + 1}">다음 &gt;</a>
					<a href="?page=${totalPages}">마지막 &raquo;</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
