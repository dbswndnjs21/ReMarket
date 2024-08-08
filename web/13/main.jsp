<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">
	function validateSearch() {
		var searchCondition = document.getElementById("searchCondition").value;
		var searchInput = document.getElementById("searchInput").value;

		if (searchCondition.trim() === "") {
			alert("검색 조건을 선택하세요.");
			return false; // 폼 제출 방지
		}

		if (searchInput.trim() === "") {
			alert("검색할 단어를 입력하세요.");
			return false; // 폼 제출 방지
		}

		return true; // 폼 제출 허용
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<!-- 검색 기능 -->
		<form action="searchProduct.do" method="get"
			onsubmit="return validateSearch()">
			<div class="block search-condition">
				<span class="form-group"> <select id="searchCondition"
					name="searchCondition" class="search-select">
						<option value="">--검색 선택--</option>
						<option value="product_name">제목</option>
						<option value="content">내용</option>
						<option value="user_id">작성자명</option>
				</select>
				</span> <span class="form-group"> <input type="text"
					id="searchInput" name="searchInput" class="search-input"
					placeholder="검색어를 입력하세요">
				</span>
				<button type="submit" class="btn search">검색</button>
			</div>
		</form>

		<!-- 인기 상품 섹션 -->
		<section class="popular-items">
			<h2>인기 상품</h2>
			<div class="items-grid">
				<c:forEach var="item" items="${hitItems}">
					<a href="viewPost.do?productId=${item.productId}" class="item">
						<c:choose>
							<c:when test="${item.fileDto != null}">
								<img
									src="<%=request.getContextPath()%>/upload/${item.fileDto.saveFileName}"
									alt="${item.productName}"  >
							</c:when>
							<c:otherwise>
								<img src="https://via.placeholder.com/150"
									alt="${item.productName}" >
							</c:otherwise>
						</c:choose>
						<div class="item-details">
							<h4>제목: ${item.productName}</h4>
							<p>가격: ${item.price}</p>
							<p>조회수: ${item.hit}</p>
							<c:choose>
								<c:when test="${item.productStatus eq '1'}">
									<img src="<%=request.getContextPath()%>/images/image1.png"
										alt="판매중" class="status-image">
								</c:when>
								<c:when test="${item.productStatus eq '2'}">
									<img src="<%=request.getContextPath()%>/images/image2.png"
										alt="예약완료" class="status-image">
								</c:when>
								<c:when test="${item.productStatus eq '3'}">
									<img src="<%=request.getContextPath()%>/images/image3.png"
										alt="판매완료" class="status-image">
								</c:when>
								<c:otherwise>
									<img src="<%=request.getContextPath()%>/images/default.jpg"
										alt="상태 없음" class="status-image">
								</c:otherwise>
							</c:choose>
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
							<c:when test="${item.fileDto != null}">
								<img
									src="<%=request.getContextPath()%>/upload/${item.fileDto.saveFileName}"
									alt="${item.productName}">
							</c:when>
							<c:otherwise>
								<img src="https://via.placeholder.com/150"
									alt="${item.productName}">
							</c:otherwise>
						</c:choose>
						<div class="item-details">
							<h4>제목: ${item.productName}</h4>
							<p>가격: ${item.price}</p>
							<p>
								작성일:
								<fmt:formatDate value="${item.modifyDate}"
									pattern="yy-MM-dd HH:mm" />
							</p>
							<c:choose>
								<c:when test="${item.productStatus eq '1'}">
									<img src="<%=request.getContextPath()%>/images/image1.png"
										alt="판매중" class="status-image">
								</c:when>
								<c:when test="${item.productStatus eq '2'}">
									<img src="<%=request.getContextPath()%>/images/image2.png"
										alt="예약완료" class="status-image">
								</c:when>
								<c:when test="${item.productStatus eq '3'}">
									<img src="<%=request.getContextPath()%>/images/image3.png"
										alt="판매완료" class="status-image">
								</c:when>
								<c:otherwise>
									<img src="<%=request.getContextPath()%>/images/default.jpg"
										alt="상태 없음" class="status-image">
								</c:otherwise>
							</c:choose>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>

		<!-- 카테고리 섹션 -->
		<section class="categories">
			<h2>카테고리</h2>
			<div class="items-grid">
				<c:forEach var="category" items="${categoryItems}">
					<a href="category.do?category=${category.category}" class="item">
						<c:choose>
							<c:when test="${category.fileDto != null}">
								<img
									src="<%=request.getContextPath()%>/upload/${category.fileDto.saveFileName}"
									alt="${category.productName}">
							</c:when>
							<c:otherwise>
								<img src="https://via.placeholder.com/150"
									alt="${category.productName}">
							</c:otherwise>
						</c:choose>
						<div class="item-details">
							<h4>제목: ${category.productName}</h4>
							<h4>가격: ${category.price}</h4>
							<h4>
								카테고리:
								<c:choose>
									<c:when test="${category.category == 'clothing'}">의류</c:when>
									<c:when test="${category.category == 'electronics'}">전자제품</c:when>
									<c:when test="${category.category == 'furniture'}">가구</c:when>
									<c:when test="${category.category == 'books'}">도서</c:when>
									<c:otherwise>기타</c:otherwise>
								</c:choose>
							</h4>
							<c:choose>
								<c:when test="${category.productStatus eq '1'}">
									<img src="<%=request.getContextPath()%>/images/image1.png"
										alt="판매중" class="status-image">
								</c:when>
								<c:when test="${category.productStatus eq '2'}">
									<img src="<%=request.getContextPath()%>/images/image2.png"
										alt="예약완료" class="status-image">
								</c:when>
								<c:when test="${category.productStatus eq '3'}">
									<img src="<%=request.getContextPath()%>/images/image3.png"
										alt="판매완료" class="status-image">
								</c:when>
								<c:otherwise>
									<img src="<%=request.getContextPath()%>/images/default.jpg"
										alt="상태 없음" class="status-image">
								</c:otherwise>
							</c:choose>
						</div>
					</a>
				</c:forEach>
			</div>
		</section>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>