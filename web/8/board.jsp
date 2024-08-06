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
					<%
					// ArrayList를 사용하여 더미 데이터 생성
					List<String[]> dummyData = new ArrayList<>();

					// 더미 데이터 추가
					dummyData.add(new String[] { "1", "공지사항: 게시판 운영 실명제 도입 안내", "김병선", "2024-07-30", "100" });
					dummyData.add(new String[] { "2", "	카페 이름은 좀 알려주세요 ", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "3", "우리동네의 다양한 정보와 이야기를 나누어요.", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "4", "올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "5", "올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "6", "[속보] 구영배 국민들께 진심 사죄…피해금액 정확히 추산 못해", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "7", "올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "8", "올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "9", "올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다", "김철수", "2024-07-29", "200" });
					dummyData.add(new String[] { "10", "올해 장마 끝…'35도 이상' 폭염·열대야 길게 이어진다", "김철수", "2024-07-29", "200" });

					// ArrayList의 데이터를 테이블에 추가
					for (String[] post : dummyData) {
					%>
					<tr>
						<td><%=post[0]%></td> 
						<td><a href = "viewBoard.jsp?id=<%=post[0] %>>"><%=post[1]%></a></td>
						<td><%=post[2]%></td>
						<td><%=post[3]%></td>
						<td><%=post[4]%></td>
					</tr>
					<%
					}
					%>
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