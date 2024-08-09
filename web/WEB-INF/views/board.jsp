<%@page import="dao.CommentDao"%>
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
		<form action="board.do" method="get" class = "block search-condition" onsubmit="return validateSearch()">
				<span class="form-Group"> 
				<select id="searchCondition" name="condition" class="search-select">
						<option value="">--검색 선택--</option>
						<option value="title" ${param.condition == 'title' ? 'selected' : ''}>제목</option>
						<option value="content" ${param.condition == 'content' ? 'selected' : ''}>내용</option>
						<option value="name" ${param.condition == 'name' ? 'selected' : ''}>작성자</option>
				</select>
				</span> 
				<span class="form-Group"> 
					<input type="text" id="searchInput" name="keyword" class="search-input" placeholder="검색어를 입력하세요"
					value="${param.keyword != null ? param.keyword : ''}">
				</span>
				<button type="submit" class="btn Search">검색</button>
				<button type="button" class="btn reset" onclick="resetSearch()">초기화</button>
			</form>

			<table class="column">
				<tr>
					<th class="table-header" style ="width: 100px;">순번</th>
					<th class="table-header title-column">제목</th>
					<th class="table-header" style ="width: 150px;">작성자명</th>
					<th class="table-header" style ="width: 150px;">등록일</th>
					<th class="table-header" style ="width: 150px;">조회수</th>
				</tr>
				<tbody>
				
					<c:forEach var="dto" items="${requestScope.lists}">
						<tr>
							<td>${dto.id}</td>
							<td><a href="viewBoard.do?id=${dto.id}">${dto.title} 
								<c:if test="${dto.commentCount > 0}">
									<span style="color: red;">(${dto.commentCount})</span>
								</c:if>
								</a>
							</td>
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
        <c:choose>
            <c:when test="${not empty condition and not empty keyword}">
                <a href="?condition=${condition}&keyword=${keyword}&page=1">&laquo; 처음</a>
                <a href="?condition=${condition}&keyword=${keyword}&page=${currentPage - 1}">&lt; 이전</a>
            </c:when>
            <c:otherwise>
                <a href="?page=1">&laquo; 처음</a>
                <a href="?page=${currentPage - 1}">&lt; 이전</a>
            </c:otherwise>
        </c:choose>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalsPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <span>${i}</span>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${not empty condition and not empty keyword}">
                        <a href="?condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="?page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <c:if test="${currentPage < totalsPages}">
        <c:choose>
            <c:when test="${not empty condition and not empty keyword}">
                <a href="?condition=${condition}&keyword=${keyword}&page=${currentPage + 1}">다음 &gt;</a>
                <a href="?condition=${condition}&keyword=${keyword}&page=${totalsPages}">마지막 &raquo;</a>
            </c:when>
            <c:otherwise>
                <a href="?page=${currentPage + 1}">다음 &gt;</a>
                <a href="?page=${totalsPages}">마지막 &raquo;</a>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>

			<!-- 글쓰기 버튼 -->
			<a href="writeBoard.do" class="write-button">글쓰기</a>
		</div>
	</div>
	
	<script>
	    function resetSearch() {
	    	window.location.href = 'board.do';    
	    }
	    
	    
	    function validateSearch() {
	        let condition = document.getElementById("searchCondition").value;
	        let keyword = document.getElementById("searchInput").value.trim(); // 입력값 공백 제거
	        if (condition === "") {
	            alert("검색 구분을 선택해주세요.");
	            return false; // 폼 제출 x
	        }
	        
	        if (keyword === "") {
	            alert("검색어를 입력하세요.");
	            return false; // 폼 제출 x
	        }
	       
	        return true; // 폼을 제출합니다.
	    }
	    
	    
	</script>
	
	
</body>
</html>