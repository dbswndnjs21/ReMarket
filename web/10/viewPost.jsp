<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
<link rel="stylesheet" type="text/css" href="css/viewPost.css">
<script type="text/javascript">
	function confirmDelete() {
		return confirm("정말 삭제하시겠습니까?");
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<c:if test="${not empty to}">
			<div class="post-view">
				<div class="wishlist-message">
					<button class="report-button">신고하기</button>
					<button class="add-to-wishlist">관심 상품에 추가</button>
					<button class="message-button">쪽지 보내기</button>
				</div>
				<h2>${to.productName}</h2>
				<p>작성자: ${to.user_id}</p>
				<p>판매금액: ${to.price}</p>
				<p>
					작성일:
					<fmt:formatDate value="${to.modifyDate}" pattern="yy-MM-dd HH:mm" />
				</p>
				<p>조회수: ${to.hit}</p>
				<p>${to.content}</p>

				<c:forEach var="file" items="${to.files}">
					<img src="./upload/${file.saveFileName}" alt="첨부파일" width="300">
				</c:forEach>

				<div class="actions">
					<!-- 로그인 아이디가 있고, 그 아이디가 작성자 아이디와 같은 경우 -->
					<c:choose>
						<c:when
							test="${not empty sessionScope.user_id and sessionScope.user_id == to.user_id}">
							<form action="editPost.do" method="get" style="display: inline;">
								<input type="hidden" name="productId" value="${to.productId}">
								<button type="submit">수정</button>
							</form>
							<form action="deletePost.do" method="post"
								style="display: inline;" onsubmit="return confirmDelete();">
								<input type="hidden" name="productId" value="${to.productId}">
								<c:forEach var="file" items="${to.files}">
									<input type="hidden" name="saveFileName"
										value="${file.saveFileName}" >
								</c:forEach>
								<button type="submit" class="delete-button">삭제</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="#" method="get" style="display: inline;">
								<input type="hidden" name="productId" value="${to.productId}">
								<button type="submit">구매예약</button>
							</form>
							<form action="#" method="get" style="display: inline;">
								<input type="hidden" name="productId" value="${to.productId}">
								<button type="submit" class="delete-button">구매완료</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 목록으로 돌아가기 버튼 추가 -->
				<div class="back-to-list">
					<a href="category.do" class="back-button">목록</a>
				</div>
			</div>
		</c:if>
		<c:if test="${empty to}">
			<p>해당 게시물을 찾을 수 없습니다.</p>
		</c:if>
	</div>
</body>
</html>