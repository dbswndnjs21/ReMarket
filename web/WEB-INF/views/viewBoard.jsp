<%@page import="dto.UserDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
<link rel="stylesheet" type="text/css" href="css/viewBoard.css">

</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<!-- 게시물 내용  -->
		<div class="post-view">
			<table class="post-table">
				<thead>
					<tr>
						<th colspan="4">${dto.title}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="light-bg author-cell">작성자명</td>
						<td class="white-bg">${dto.userName}</td>
						<td class="light-bg date-cell">등록일</td>
						<td class="white-bg">${dto.formattedCreatedAt}</td>
					</tr>
					<tr>
						<td class="light-bg view-count-cell">조회수</td>
						<td colspan="3" class="white-bg">${dto.hit}</td>
					</tr>
					<tr>
						<td colspan="4" class="content-cell" id="contentCell">
							${dto.content}
						</td>
					</tr>
				</tbody>
			</table>
			

			<!-- 댓글 박스: 달려있는 댓글, 댓글 입력창 포함 -->
			<div class = "comment-box">
				<c:forEach var ="comment" items="${commentList}"> <!-- 댓글 반복문 실행, 모든 댓글 불러오기 -->
				<div class ="comment-area">
					
					<!-- 게시글 작성자의 pcode와 댓글 작성자의 pcode가 일치하면 작성자 표시 -->
					<c:choose>
						<c:when test="${comment.userId == dto.userId}">
							<div class ="comment-id">
								<span>${comment.userName}</span> 
								<img src="images/ico-post-writer.svg" width ="50" height="30" style="margin-top: 0px; margin-bottom: 15; padding-left: 5px;">
							</div>
						</c:when>
						<c:otherwise>
							<div class ="comment-id">
								${comment.userName} 
							</div>
						</c:otherwise>
					</c:choose>
					 
					
					<div class ="comment-content">
						${comment.content} <!-- 댓글 내용 --> 
					</div>
					
					 <!-- 댓글 수정 폼 -->
						    <div id="editForm-${comment.id}" class="edit-comment-form" style="display:none;">
						        <form action="editComment.do" method="post" style ="text-align: right; ">
						            <input type="hidden" name="comment-boardId" value="${comment.boardId}">
						            <input type="hidden" name="comment-id" value="${comment.id}"> 
						            <textarea name="comment-content" class="comment-textarea" >${comment.content}</textarea>
						            <button type="submit" class="complete-submit-button">수정 완료</button>
						            <button type="button" onclick="toggleEditForm('${comment.id}');" class="update-cancel-button">취소</button>
						        </form>
						    </div>
					
					
					
					<div class="comment-details"> <!-- 댓글 작성일과 수정, 삭제 버튼을 한 태그에 담기 -->
						<div class ="comment-date">
							${comment.formattedCreatedAt} <!-- 댓글 입력 날짜 및 시간 -->
						</div>
					 	
					 	<c:if test="${comment.userId == pcode}">
						 	<div class="comment-actions" id="actionButtons-${comment.id}">
						 		<!-- 수정 버튼 폼 -->
						 		 <button class="edit-button" onclick="toggleEditForm('${comment.id}');">수정</button>
				                
				                <!-- 삭제 버튼 폼 -->
				                <form action="deleteComment.do" method="post" style="display: inline-block; margin: 0;" onsubmit="return confirmDelete();">
				                	<input type="hidden" name = "commentId" value = "${comment.id}"> 
				                	<input type ="hidden" name = "boardId" value ="${dto.id}"> <!-- 해당 게시글의 id를 보내야함. -->
				                	<button class="delete-button">삭제</button>
				                </form>
		           			</div>
				 		
				 		</c:if>
				 	</div>
				</div>
			</c:forEach>
			
				<!-- 댓글 입력창 -->
				<div class="comment-section">
					<div class="comment-input">
						<c:choose>
							<c:when test = "${not empty userName}">
								<div class="user-id">${userName}</div>
							</c:when>
							<c:otherwise>
								<div class="user-id">${loginMessage}</div>
							</c:otherwise>						
						</c:choose>
						<form action="comment.do" method="post" onsubmit="return validateComment('${userName}');">
							<input type ="hidden" name = "boardId" value ="${dto.id}">
							<input type ="hidden" name = "boardUserId" value ="${dto.userId}">
							<input type="hidden" name ="userName" value ="${userName}">
							<textarea placeholder="댓글을 남겨보세요." class="comment-input-field" id="commentInput" name = "commentContent"></textarea>
							<button class="comment-submit-button">댓글 등록</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 게시글 신고, 쪽지, 수정, 삭제, 목록 버튼 -->
			<!-- 게시글 작성자 id와 현재 접속 id(session)가 동일할 때 수정 삭제 표현 -->
			<c:if test="${dto.userId == pcode}">
				<!-- 해당 pcode는 viewBoardController에서 doget 메서드에서 전달받음. -->
				<div class="actions">
					<form action="viewBoard.do" method="post" style="display: inline;">
					 <input type="hidden" name="id" value="${dto.id}" />
						<button type="submit">수정</button>
					</form>
	
					<form action="deleteBoard.do" method="post" style="display: inline;" onsubmit="return confirmDeleteBoard();">
						<input type="hidden" name= "id" value = "${dto.id}">
						<button type="submit" class="delete-button">삭제</button>
					</form>
				</div>
			</c:if>
<!--  				신고 버튼, 쪽지 보내기 버튼 -> 게시글 작성자id != id 일때 화면에 표시 
			<div class="wishlist-message">
				<button class="report-button">신고하기</button>
				<button class="message-button">쪽지 보내기</button>
			</div>
			
 -->
			<div class="button-container">
				<a href="board.do">목록</a>
			</div>

		</div>
	</div>
	
	
	<!-- TEXTAREA 줄바꿈 시, 텍스트가 아래로 내려가도록 조정하는 코드 -->
	<script type="text/javascript">
	document.getElementById('commentInput').addEventListener('input', function () {
	    this.style.height = 'auto';
	    this.style.height = (this.scrollHeight) + 'px';
	});
	
	function confirmDelete() {
		return confirm('댓글을 삭제하시겠습니까?');
	}
	
	function confirmDeleteBoard() {
        return confirm('게시글을 삭제하시겠습니까?');
    }
	
	function checkLogin(userName) {
    	if(!userName) {
    		if (confirm('로그인 후 이용 가능합니다. 로그인 하시겠습니까?')) {
                // 확인 버튼을 누르면 로그인 컨트롤러로 이동
                window.location.href = 'login.do';
                return false;		
    	} else {
                // 취소 버튼을 누르면 그대로 머무르기
                return false;
    		}
    	}   
    	return true;	
	}
	
	function validateComment(userName) {
		if(!checkLogin(userName)) {
			return false;
		}
		let commentContent = document.getElementById('commentInput').value.trim();
		if(commentContent === "") {
			alert("내용을 입력해주세요.");
			document.getElementById('commentInput').focus();
			return false;
		}
		
		return true;
	}
	
	function toggleEditForm(commentId) {
	    var form = document.getElementById('editForm-' + commentId);
	    var actionButtons = document.getElementById('actionButtons-' + commentId); 
	    if (form.style.display === 'none') {
	        form.style.display = 'block';
	        actionButtons.style.display = "none"; // 수정 및 삭제 버튼 숨기기
	    } else {
	        form.style.display = 'none';
	        actionButtons.style.display = "block"; // 수정 및 삭제 버튼 보이기
	    }
	}
	
    // 줄바꿈을 <br>로 변환하는 함수
    function formatContent() {
        var contentCell = document.getElementById('contentCell');
        contentCell.innerHTML = contentCell.innerHTML.replace(/\n/g, '<br>');
    }

    // 페이지 로드 시 함수 호출
    window.onload = formatContent;
	
	</script>

</body>
</html> 