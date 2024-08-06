<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>인기 상품</title>
<link rel="stylesheet" type="text/css" href="css/hit.css">
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<div class="section">
			<h2>인기 상품</h2>
			<c:forEach var="product" items="${list}">
				<div class="post">
					<div class="post-details">
						<h3>
							<a href="viewPost.do?productId=${product.productId}">${product.productName}</a>
						</h3>
						<p>작성자: ${product.user_id}</p>
						<p>판매금액: ${product.price}</p>
						<p>조회수: ${product.hit}</p>
						<p>${product.content}</p>
					</div>
					<c:if test="${not empty product.fileDto}">
						<div class="post-file">
							<%--                            <c:forEach var="file" items="${product.fileDto}">--%>
							<c:choose>
								<c:when test="${product.productStatus eq '1'}">
									<img src="<%=request.getContextPath()%>/images/image1.png"
										alt="판매중" style="width: 75px; height: 75px;">
								</c:when>
								<c:when test="${product.productStatus eq '2'}">
									<img src="<%=request.getContextPath()%>/images/image2.png"
										alt="예약완료" style="width: 75px; height: 75px;">
								</c:when>
								<c:when test="${product.productStatus eq '3'}">
									<img src="<%=request.getContextPath()%>/images/image3.png"
										alt="판매완료" style="width: 75px; height: 75px;">
								</c:when>
								<c:otherwise>
									<!-- 기본 이미지나 상태 없음 -->
									<img src="<%=request.getContextPath()%>/images/default.jpg"
										alt="상태 없음" style="width: 50px; height: 50px;">
								</c:otherwise>
							</c:choose>
							<img
								src="${pageContext.request.contextPath}/upload/${product.fileDto.saveFileName}"
								alt="첨부파일" style="width: 100px; height: 100px;">
							<%--                            </c:forEach>--%>
						</div>
					</c:if>

				</div>
			</c:forEach>
			<div class="pagination">
				<c:choose>
					<c:when test="${page > 1}">
						<a href="hit.do?productId=${product.productId}&page=1">처음</a>
						<a href="hit.do?productId=${product.productId}&page=${page - 1}">이전</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="disabled">처음</a>
						<a href="#" class="disabled">이전</a>
					</c:otherwise>
				</c:choose>

				<c:forEach var="i" begin="1" end="${totalPages}">
					<a href="hit.do?productId=${product.productId}&page=${i}"
						class="${page eq i ? 'active' : ''}">${i}</a>
				</c:forEach>

				<c:choose>
					<c:when test="${page < totalPages}">
						<a href="hit.do?productId=${product.productId}&page=${page + 1}">다음</a>
						<a href="hit.do?productId=${product.productId}&page=${totalPages}">마지막</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="disabled">다음</a>
						<a href="#" class="disabled">마지막</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>