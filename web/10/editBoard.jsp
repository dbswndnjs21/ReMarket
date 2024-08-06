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
			<table class="post-table">
				<thead>
					<tr>
						<th colspan="4">올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="light-bg author-cell">작성자명</td>
						<td class="white-bg">이름</td>
						<td class="light-bg date-cell">등록일</td>
						<td class="white-bg">날짜</td>
					</tr>
					<tr>
						<td class="light-bg view-count-cell">조회수</td>
						<td colspan="3" class="white-bg">123</td>
					</tr>
					<tr>
						<td colspan="4" class="content-cell">게시글 내용이 여기에 들어갑니다. 이곳에
							실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이
							여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을
							작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다.
							이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글
							내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글
							내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에
							들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요.
							게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제
							글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에
							들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요.

							게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제
							글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에
							들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요.
							게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제
							글 내용을 작성하세요. 게시글 내용이 여기에 들어갑니다. 이곳에 실제 글 내용을 작성하세요.</td>
					</tr>
				</tbody>

			</table>

			<div class="actions">
				<form action="editBoard.jsp" method="get" style="display: inline;">
					<button type="submit">수정</button>
				</form>

				<form action="deleteBoard.jsp" method="post"
					style="display: inline;">
					<button type="submit" class="delete-button">삭제</button>
				</form>
			</div>
			
			
			<div class="button-container">
				<a href="board.jsp">목록</a>
			</div>

		</div>
	</div>
</body>
</html>