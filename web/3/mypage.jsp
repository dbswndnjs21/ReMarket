<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <style>
    </style>
    <link rel="stylesheet" type="text/css" href="css/mypage.css">	
    <script>
        function showEditForm() {
            document.getElementById('edit-form').classList.add('active');
        }

        function hideEditForm() {
            document.getElementById('edit-form').classList.remove('active');
        }
    </script>
</head>
<body>
      <header class="header">
        <div class="container">
            <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
            <h1>마이페이지</h1>
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
            <a href="#">판매등록</a>
        </div>
        <div>
            <a href="mypage.jsp">마이페이지</a>
            <a href="login.jsp">로그인</a>
            <a href="member.jsp">회원가입</a>
        </div>
    </nav>

    <div class="container clearfix">
        <aside class="sidebar">
            <h2>마이페이지 메뉴</h2>
            <ul>
                <li><a href="editProfile.jsp">회원 정보 수정</a></li>
                <li><a href="myWriteList.jsp">내가 작성한 글</a></li>
                <li><a href="orderList.jsp">구매 내역</a></li>
                <li><a href="wishList.jsp">관심 상품</a></li>
                
            </ul>
        </aside>

        <section class="content">
            <div id="profile" class="section">
                <h2>회원 정보</h2>
                <div class="item">
                    <p><strong>이름:</strong> 홍길동</p>
                    <p><strong>이메일:</strong> hong@example.com</p>
                    <p><strong>전화번호:</strong> 010-1234-5678</p>
                    <div class="file-upload">
                        <label for="profile-pic">프로필 사진:</label>
                        <input type="file" id="profile-pic" name="profile-pic">
                    </div>
                </div>
            </div>

            <div id="edit-form" class="form-container">
                <h2>회원 정보 수정</h2>
                <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" value="홍길동">
                    
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" value="hong@example.com">
                    
                    <label for="phone">전화번호:</label>
                    <input type="tel" id="phone" name="phone" value="010-1234-5678">
                    
                    <label for="profile-pic-upload">프로필 사진 업로드:</label>
                    <input type="file" id="profile-pic-upload" name="profile-pic-upload">

                    <button type="submit">수정 완료</button>
                    <button type="button" onclick="hideEditForm()">취소</button>
                </form>
            </div>
        </section>
    </div>
</body>
</html>