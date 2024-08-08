<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String msg = (String) request.getAttribute("msg");
String rmg = (String) session.getAttribute("rmg");
if (rmg != null) {
	session.removeAttribute("rmg"); // 메시지 출력 후 제거
}
%>
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

        function requireLogin() {
            alert("로그인을 하셔야 합니다.");
            return false;
        }
        
        function handleReservation(status, form) {
            if (status === "1") {
                if (confirm("판매예약 하시겠습니까?")) {
                    form.submit();
                }
            } else if (status === "2") {
                alert("이미 예약중인 상품입니다.");
            } else if (status === "3") {
                alert("이미 판매완료된 상품입니다.");
            }
            return false; 
        }

        function handleSaleCompletion(status, form) {
            if (status === "1") {
                alert("예약을 먼저 진행해주세요.");
            } else if (status === "2") {
                if (confirm("정말 판매완료 처리 하시겠습니까?")) {
                    form.submit();
                }
            } else if (status === "3") {
                alert("이미 판매완료된 상품입니다.");
            }
            return false; 
        }
        function showAlert(message) {
            if (message) {
                alert(message);
            }
        }

        window.onload = function() {
            var rmg = "<%=rmg != null ? rmg : ""%>";
            showAlert(rmg);
        };
    </script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container">
		<c:if test="${not empty to}">
			<div class="post-view">
				<div class="wishlist-message">
					<c:if test="${sessionScope.user_id ne to.user_id}">
						<c:choose>
							<c:when test="${not empty sessionScope.user_id}">
								<a
									href="writeBlame.do?author=${to.user_id}&postTitle=${to.productName}&productId=${to.productId}"
									class="report-button">신고하기</a>
							</c:when>
							<c:otherwise>
								<a href="login.do" class="report-button">신고하기</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty sessionScope.user_id}">
								<button class="add-to-wishlist" onclick="requireLogin()">관심
									상품에 추가</button>
							</c:when>
							<c:otherwise>
								<form action="wishList.do" method="post"
									style="display: inline;">
									<input type="hidden" name="productId" value="${to.productId}">
									<input type="hidden" name="productUser_id" value="${to.user_id}"> 
									<input type="hidden" name="productName" value="${to.productName}">
									<button type="submit" class="add-to-wishlist">관심 상품에 추가</button>
								</form>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty sessionScope.user_id}">
								<button class="message-button" onclick="requireLogin()">쪽지
									보내기</button>
							</c:when>
							<c:otherwise>
								<form action="sendMessage.do" method="get"
									style="display: inline;">
									<input type="hidden" name="receiveId" value="${to.user_id}">
									<input type="hidden" name="productName"
										value="${to.productName}">
									<button type="submit" class="message-button">쪽지 보내기</button>
								</form>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
				<h2>${to.productName}</h2>
				<p>작성자: ${to.user_id}</p>
				<p>판매금액: ${to.price}</p>
				<p>
					작성일:
					<fmt:formatDate value="${to.modifyDate}" pattern="yy-MM-dd HH:mm" />
				</p>
				<p>조회수: ${to.hit}</p>
				<p>내용: ${to.content}</p>

				<c:forEach var="file" items="${to.files}">
					<img src="./upload/${file.saveFileName}" alt="첨부파일" width="300">
				</c:forEach>

				<div class="actions">
					<!-- 로그인 아이디가 있고, 그 아이디가 작성자 아이디와 같은 경우 -->
					<c:choose>
						<c:when
							test="${not empty sessionScope.user_id and sessionScope.user_id == to.user_id or sessionScope.user_id == 'admin'}">
							<form action="editPost.do" method="get" style="display: inline;">
								<input type="hidden" name="productId" value="${to.productId}">
								<button type="submit">수정</button>
							</form>
							<form action="deletePost.do" method="post"
								style="display: inline;" onsubmit="return confirmDelete();">
								<input type="hidden" name="productId" value="${to.productId}">
								<c:forEach var="file" items="${to.files}">
									<input type="hidden" name="saveFileName"
										value="${file.saveFileName}">
								</c:forEach>
								<button type="submit" class="delete-button">삭제</button>
							</form>


							<form action="reserve.do" method="get" style="display: inline;"
								onsubmit="return handleReservation('${to.productStatus}', this);">
								<input type="hidden" name="productId" value="${to.productId}">
								<input type="hidden" name="productStatus"
									value="${to.productStatus}"> <input type="hidden"
									name="returnPage" value="${sessionScope.returnPage}">

								<button type="submit">판매예약</button>
							</form>
							<form action="reserve.do" method="get" style="display: inline;"
								onsubmit="return handleSaleCompletion('${to.productStatus}', this);">
								<input type="hidden" name="productId" value="${to.productId}">
								<input type="hidden" name="productStatus"
									value="${to.productStatus}"> <input type="hidden"
									name="returnPage" value="${sessionScope.returnPage}">

								<button type="submit" class="delete-button">판매완료</button>
							</form>

						</c:when>
					</c:choose>
				</div>
				<!-- 목록으로 돌아가기 버튼 추가 -->
				<div class="back-to-list">
					<c:choose>
						<c:when test="${not empty sessionScope.returnPage}">
							<a href="${sessionScope.returnPage}" class="back-button">목록</a>
							<%
							session.removeAttribute("returnPage");
							%>
						</c:when>
						<c:otherwise>
							<a href="category.do" class="back-button">목록</a>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:if>
		<c:if test="${empty to}">
			<p>해당 게시물을 찾을 수 없습니다.</p>
		</c:if>

	</div>
	<%
	if (msg != null && !msg.isEmpty()) {
	%>
	<script type="text/javascript">
    alert('<%=msg%>');
	</script>
	<%
	}
	%>

</body>
</html>
