<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	background-color: #f9f9f9;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: flex-start;
	height: 50%;
	width: 35%;
	background-color: white;
	margin: 100px auto 0;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	position: relative; /* 새로 추가된 속성 */
}

.inner {
	margin-top: 95px;
	margin-left: 30px;
	margin-right: 30px;
}

h1 {
	margin-bottom: 50px;
	font-size: 30px;
	font-weight: bold;
	color: rgb(63, 63, 63);
}

#member_id {
	width: 100%;
	height: 3.75rem;
	padding: 0px;
	font-size: 1.3125rem;
	font-weight: 700;
	border-bottom: 1px solid rgb(229, 229, 229);
	outline: none;
	appearance: none;
}

#pwd {
	width: 100%;
	height: 3.75rem;
	padding: 0px;
	font-size: 1.3125rem;
	font-weight: 700;
	border-bottom: 1px solid rgb(229, 229, 229);
	outline: none;
	appearance: none;
}

input {
	font-synthesis: none;
	-webkit-font-smoothing: antialiased;
	direction: ltr;
	text-align: left;
	color: rgb(33, 33, 33);
	letter-spacing: -0.5px;
	outline: 0px;
	border: 0px;
	margin-bottom: 20px;
}

button {
	display: inline-flex;
	width: 100%;
	height: 72px;
	border-radius: 6px;
	background-color: rgb(0, 128, 24);
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	font-size: 1.125rem;
	font-weight: 700;
	color: rgb(255, 255, 255);
	text-align: center;
	border: none;
}

.but:disabled {
	opacity: 0.3;
	cursor: not-allowed;
}

a {
	position: absolute;
	top : 90%;
	bottom : 10%;
	right: 7%;
	lgft : 93%;.
	font-size: 13px;
	color: gray;
	text-align: right;
	margin: 0;
}

a:hover {
	color : black;
}

a:active {
	color:gray;
}

a:visited {
	color:gray;
}
</style>
</head>
<body>
	<body>
	<div class="container">
		<div class="inner">
			<h1>로그인 정보를 입력해주세요</h1>
			
			<form action="#" method="post" name="loginFrm">
				<input type="text" id="member_id" placeholder="아이디" name="member_id" />
				<input type="text" id="pwd" placeholder="전화번호" maxlength="30" name="pwd"/>

			</form>
			<button type="submit" disabled="disabled" class="but" onclick="loginCheck()">로그인</button>
			
			<a href="member.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>