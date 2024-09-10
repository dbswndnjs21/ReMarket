<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link rel="stylesheet" type="text/css" href="css/editBoard.css">
</head>

<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<!-- 게시물 내용  -->
		<div class="post-view">
		<form action="editBoard.do" method="post">
			<table class="post-table">
				<thead>
					<tr>
						<th colspan="4">
						<input type="text" name = "title" value = "${dto.title}" class="title-input"/>
						</th>
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
						<td colspan="4" class="content-cell">
							 <textarea rows="4" cols="50" name = "content">${dto.content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
				
				<div class="actions">
						<button type="submit" class="submit-button">수정</button>
						<input type="hidden" name = "id" value ="${dto.id}"/>
						<button type="button" class="cancel-button" onclick="window.location.href='board.do'">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>