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
   <div class="container">
      <div class="inner">
         <h1>로그인 정보를 입력해주세요</h1>

         <form action="login.do" method="post" name="loginFrm">
            <input type="text" id="user_id" placeholder="아이디" name="user_id" />
            <input type="password" id="password" placeholder="비밀번호" maxlength="30" name="password"/>
            <span id="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></span>
            <button type="submit" name="action" class="but" value="register">로그인</button>
         </form>
			
         <a href="/join.do">회원가입</a>
      </div>
   </div>
</body>
</html>