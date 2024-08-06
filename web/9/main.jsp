<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다시마켓</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<%
if (msg != null && !msg.isEmpty()) {
%>
<script type="text/javascript">
        alert('<%=msg%>
	');
</script>
<%
}
%>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<div class="search-bar">
			<input type="text" placeholder="검색어를 입력하세요..."> <input
				type="submit" value="검색">
		</div>

		<!-- 카테고리 섹션 -->
		<section class="categories">
			<h2>카테고리</h2>
			<div class="items-grid">
				<c:forEach var="category" items="${categoryItems}">
					<a href="viewPost.do?productId=${category.productId}" class="item">
						<c:choose>
							<c:when
								test="${category.files != null and category.files.size() > 0}">
								<img
									src="<%=request.getContextPath()%>/upload/${category.files[0].saveFileName}"
									alt="${category.productName}">
							</c:when>
							<c:otherwise>

								<img src="https://via.placeholder.com/150"
									alt="${category.productName}">
							</c:otherwise>
						</c:choose>
						<div class="item-details">
							<h4>${category.productName}</h4>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>

		<!-- 인기 상품 섹션 -->
		<section class="popular-items">
			<h2>인기 상품</h2>
			<div class="items-grid">
				<c:forEach var="item" items="${hitItems}">
					<a href="viewPost.do?productId=${item.productId}" class="item">
						<c:choose>
							<c:when test="${item.files != null and item.files.size() > 0}">
								<img
									src="<%=request.getContextPath()%>/upload/${item.files[0].saveFileName}"
									alt="${category.productName}">
							</c:when>
							<c:otherwise>
								<img src="https://via.placeholder.com/150"
									alt="${item.productName}">
							</c:otherwise>
						</c:choose>
						<div class="item-details">
							<h4>${item.productName}</h4>
							<p>${item.price}</p>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>

		<!-- 최신 상품 섹션 -->
		<section class="new-items">
			<h2>최신 상품</h2>
			<div class="items-grid">
				<c:forEach var="item" items="${newItem}">
					<a href="viewPost.do?productId=${item.productId}" class="item">
						<c:choose>
							<c:when test="${item.files != null and item.files.size() > 0}">
								<img
									src="<%=request.getContextPath()%>/upload/${item.files[0].saveFileName}"
									alt="${item.productName}">
							</c:when>
							<c:otherwise>
								<img src="https://via.placeholder.com/150"
									alt="${item.productName}">
							</c:otherwise>
						</c:choose>
						<div class="item-details">
							<h4>${item.productName}</h4>
							<p>${item.price}</p>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>
	</div>
</body>
</html>