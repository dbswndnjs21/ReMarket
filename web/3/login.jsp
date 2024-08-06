<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<link rel="stylesheet" type="text/css" href="css/login.css">	
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