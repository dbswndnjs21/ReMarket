<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/category.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<!-- 카테고리 선택 버튼 -->
		<div class="category-menu">
			<a href="category.do?category=all"><button>전체</button></a> <a
				href="category.do?category=electronics"><button>전자제품</button></a> <a
				href="category.do?category=furniture"><button>가구</button></a> <a
				href="category.do?category=clothing"><button>의류</button></a> <a
				href="category.do?category=books"><button>도서</button></a>
		</div>

		<c:set var="category" value="${category eq null ? 'all' : category}" />
		<c:choose>
			<c:when test="${category eq 'electronics'}">
				<c:set var="categoryTitle" value="전자제품" />
			</c:when>
			<c:when test="${category eq 'furniture'}">
				<c:set var="categoryTitle" value="가구" />
			</c:when>
			<c:when test="${category eq 'clothing'}">
				<c:set var="categoryTitle" value="의류" />
			</c:when>
			<c:when test="${category eq 'books'}">
				<c:set var="categoryTitle" value="도서" />
			</c:when>
			<c:otherwise>
				<c:set var="categoryTitle" value="전체 게시물" />
			</c:otherwise>
		</c:choose>

		<div class="section">
			<h2>${categoryTitle}</h2>

			<c:choose>
				<c:when test="${not empty filterCategory}">
					<c:forEach var="product" items="${filterCategory}">
						<c:set var="fileSaveName" value="default.jpg" />
						<c:if test="${not empty product.fileDto}">
							<c:set var="fileSaveName" value="${product.fileDto.saveFileName}" />
						</c:if>
						<div class="post">
							<div class="post-details">
								<h3>
									<a href="viewPost.do?productId=${product.productId}">${product.productName}</a>
								</h3>
								<p>작성자: ${product.user_id}</p>
								<!-- 수정된 부분 -->
								<p>판매금액: ${product.price}</p>
								<p>${product.content}</p>
							</div>
							<div class="post-file">
								<c:choose>
									<c:when test="${product.productStatus eq '1'}">
										<img src="<%=request.getContextPath()%>/images/image1.png"
											alt="판매중" style="width: 75px; height: 75px;" >
									</c:when>
									<c:when test="${product.productStatus eq '2'}">
										<img src="<%=request.getContextPath()%>/images/image2.png"
											alt="예약완료" style="width: 75px; height: 75px;">
									</c:when>
									<c:when test="${product.productStatus eq '3'}">
										<img src="<%=request.getContextPath()%>/images/image3.png"
											alt="판매완료" style="width: 75px; height: 75px;" >
									</c:when>
									<c:otherwise>
										<!-- 기본 이미지나 상태 없음 -->
										<img src="<%=request.getContextPath()%>/images/default.jpg"
											alt="상태 없음" style="width: 50px; height: 50px;">
									</c:otherwise>
								</c:choose>
								<img src="<%=request.getContextPath()%>/upload/${fileSaveName}"
									alt="첨부파일" style="width: 100px; height: 100px;">

							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>게시물이 없습니다.</p>
				</c:otherwise>
			</c:choose>
			<div class="pagination">
				<c:choose>
					<c:when test="${page > 1}">
						<a href="category.do?category=${category}&page=1">처음</a>
						<a href="category.do?category=${category}&page=${page - 1}">이전</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="disabled">처음</a>
						<a href="#" class="disabled">이전</a>
					</c:otherwise>
				</c:choose>

				<c:forEach var="i" begin="1" end="${totalPages}">
					<a href="category.do?category=${category}&page=${i}"
						class="${page eq i ? 'active' : ''}">${i}</a>
				</c:forEach>

				<c:choose>
					<c:when test="${page < totalPages}">
						<a href="category.do?category=${category}&page=${page + 1}">다음</a>
						<a href="category.do?category=${category}&page=${totalPages}">마지막</a>
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