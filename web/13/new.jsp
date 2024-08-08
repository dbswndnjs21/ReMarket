<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>최신 상품</title>
<link rel="stylesheet" type="text/css" href="css/new.css">
</head>
<body>
	<jsp:include page="header.jsp" />


	 <div class="container">
        <!-- 상태 필터링 메뉴 -->
        <div class="status-menu">
            <form action="new.do" method="get">
                <!-- 필터링 상태를 유지하기 위해 현재 상태 값을 선택 필드로 설정 -->
                <select name="status">
                    <option value="all" ${status eq 'all' ? 'selected' : ''}>전체 상태</option>
                    <option value="1" ${status eq '1' ? 'selected' : ''}>판매중</option>
                    <option value="2" ${status eq '2' ? 'selected' : ''}>예약완료</option>
                    <option value="3" ${status eq '3' ? 'selected' : ''}>판매완료</option>
                </select>
                <button type="submit">적용</button>
            </form>
        </div>
		<div class="section">
			<h2>최신 상품</h2>
			<c:forEach var="product" items="${list}">
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
						<p>판매금액: ${product.price}</p>
						<p>
							등록일자:
							<fmt:formatDate value="${product.modifyDate}"
								pattern="yy-MM-dd HH:mm" />
						</p>
						<p>${product.content}</p>
					</div>
					<div class="post-file">
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
							src="${pageContext.request.contextPath}/upload/${fileSaveName}"
							alt="첨부파일" width="150">
					</div>
				</div>
			</c:forEach>
	
			 <div class="pagination">
                <!-- 이전 그룹 링크 -->
                <c:if test="${startPage > 1}">
                    <a href="new.do?status=${status}&page=1">처음</a>
                    <a href="new.do?status=${status}&page=${startPage - 1}">이전</a>
                </c:if>

                <!-- 페이지 링크 -->
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <a href="new.do?status=${status}&page=${i}" class="${page eq i ? 'active' : ''}">${i}</a>
                </c:forEach>

                <!-- 다음 그룹 링크 -->
                <c:if test="${endPage < totalPages}">
                    <a href="new.do?status=${status}&page=${endPage + 1}">다음</a>
                    <a href="new.do?status=${status}&page=${totalPages}">마지막</a>
                </c:if>
            </div>

		</div>
	</div>
</body>
</html>