<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>검색 결과 - 다시마켓</title>
<link rel="stylesheet" type="text/css" href="css/searchProduct.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="status-menu">
			<form action="searchProduct.do" method="get">
				<input type="hidden" name="searchCondition" value="${searchCondition}"> 
				<input type="hidden"name="searchInput" value="${searchInput}"> 
				<select name="status">
					<option value="all" ${status eq 'all' ? 'selected' : ''}>전체
						상태</option>
					<option value="1" ${status eq '1' ? 'selected' : ''}>판매중</option>
					<option value="2" ${status eq '2' ? 'selected' : ''}>예약완료</option>
					<option value="3" ${status eq '3' ? 'selected' : ''}>판매완료</option>
				</select>
				<button type="submit">적용</button>
			</form>
		</div>
		<div class="section">
			<h2>검색 결과</h2>
			<c:if test="${not empty list}">
				<div class="items-grid">
					<c:forEach var="item" items="${list}">
						<div class="post">
							<div class="post-details">
								<h3>
									<a href="viewPost.do?productId=${item.productId}">${item.productName}</a>
								</h3>
								<p>가격: ${item.price}</p>
								<p>작성자: ${item.user_id}</p>
								<p>
									작성일:
									<fmt:formatDate value="${item.modifyDate}"
										pattern="yy-MM-dd HH:mm" />
								</p>
							</div>
							<c:if test="${item.files != null }">
								<div class="post-file">
									<c:choose>
										<c:when test="${item.productStatus eq '1'}">
											<img src="<%=request.getContextPath()%>/images/image1.png"
												alt="판매중" style="width: 75px; height: 75px;">
										</c:when>
										<c:when test="${item.productStatus eq '2'}">
											<img src="<%=request.getContextPath()%>/images/image2.png"
												alt="예약완료" style="width: 75px; height: 75px;">
										</c:when>
										<c:when test="${item.productStatus eq '3'}">
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
										src="${pageContext.request.contextPath}/upload/${item.fileDto.saveFileName}"
										alt="${item.productName}">
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${empty list}">
				<p>검색 결과가 없습니다.</p>
			</c:if>
			 <div class="pagination">
                <!-- 이전 그룹 링크 -->
                <c:if test="${startPage > 1}">
                    <a href="searchProduct.do?searchCondition=${searchCondition}&searchInput=${searchInput}&status=${status}&page=1">처음</a>
                    <a href="searchProduct.do?searchCondition=${searchCondition}&searchInput=${searchInput}&status=${status}&page=${startPage - 1}">이전</a>
                </c:if>

                <!-- 페이지 링크 -->
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="searchProduct.do?searchCondition=${searchCondition}&searchInput=${searchInput}&status=${status}&page=${i}"
                        class="${page eq i ? 'active' : ''}">${i}</a>
                </c:forEach>

                <!-- 다음 그룹 링크 -->
                <c:if test="${endPage < totalPages}">
                    <a href="searchProduct.do?searchCondition=${searchCondition}&searchInput=${searchInput}&status=${status}&page=${endPage + 1}">다음</a>
                    <a href="searchProduct.do?searchCondition=${searchCondition}&searchInput=${searchInput}&status=${status}&page=${totalPages}">마지막</a>
                </c:if>
            </div>
		</div>
	</div>
</body>
</html>