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
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
            text-align: center;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            background: #333;
            color: #fff;
            padding: 10px 0;
        }

        .nav a {
            color: #fff;
            padding: 0 20px;
            text-decoration: none;
        }

        .nav a:hover {
            background: #575757;
        }

        .sidebar {
            float: left;
            width: 25%;
            background: #fff;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .content {
            float: right;
            width: 70%;
            background: #fff;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .section {
            margin-bottom: 20px;
        }

        h2 {
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            color: #4CAF50;
        }

        .item {
            background: #fff;
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }

        .file-upload {
            margin-top: 20px;
        }

        .file-upload label {
            display: block;
            margin: 10px 0 5px;
        }

        .file-upload input[type="file"] {
            margin: 10px 0;
        }

        .form-container {
            display: none;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container.active {
            display: block;
        }

        .form-container label {
            display: block;
            margin: 10px 0 5px;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .form-container button:hover {
            background-color: #45a049;
        }
    </style>
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
            <h1>마이페이지</h1>
        </div>
    </header>

    <nav class="nav">
        <div class="container">
            <a href="main.jsp">홈</a>
            <a href="category.jsp">카테고리</a>
            <a href="hit.jsp">인기 상품</a>
            <a href="new.jsp">최신 상품</a>
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