<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="css/editProfile.css">
    <style>
        /* 추가 스타일 필요시 작성 */
    </style>
</head>
<body>
    <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>회원 정보 수정</h1>
        </div>
        <div class="icons">
            <a href="messages.jsp">
                <img src="images/belloff.svg" alt="메시지 아이콘" width="30">
            </a>
            <a href="alram.jsp">
                <img src="images/belloff1.svg" alt="알림 벨 아이콘" width="30">
            </a>
        </div>
    </header>

    <nav class="nav">
        <div class="container">
            <a href="main.jsp">홈</a>
            <a href="category.jsp">카테고리</a>
            <a href="hit.jsp">인기 상품</a>
            <a href="new.jsp">최신 상품</a>
            <a href="board.jsp">자유 게시판</a>
            <a href="writeProduct.jsp">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

    <div class="container clearfix">
        <section class="content">
            <div id="edit-profile" class="form-container">
                <h2>회원 정보 수정</h2>
                <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                    <p><strong>아이디:</strong> <c:out value="${sessionScope.user.id}"/></p> <!-- 자동 표시, 수정 불가 -->
                    
                    <label for="password">비밀번호:</label>
                    <input type="password" id="password" name="password" placeholder="새 비밀번호">
                    
                    <label for="confirm-password">비밀번호 확인:</label>
                    <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인">
                    
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" value="${sessionScope.user.name}">
                    
                    <label for="birthdate">생년월일:</label>
                    <input type="date" id="birthdate" name="birthdate" value="${sessionScope.user.birthdate}">
                    
                    <label for="phone">전화번호:</label>
                    <input type="tel" id="phone" name="phone" value="${sessionScope.user.phone}">
                    
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" value="${sessionScope.user.email}">
                    
                    <label for="address">주소:</label>
                    <input type="text" id="address" name="address" value="${sessionScope.user.address}">
                    
                    <p><strong>가입날짜:</strong> <c:out value="${sessionScope.user.signupDate}"/></p> <!-- 자동 표시, 수정 불가 -->

                    <button type="submit">수정 완료</button>
                    <a href="mypage.jsp" class="cancel-button">취소</a>
                </form>
            </div>
        </section>
    </div>
</body>
</html>