<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
</style>
<link rel="stylesheet" type="text/css" href="css/member.css">   
</head>
<body>
   <div class="container">
      <div class="inner">
         <h1>본인 정보를 입력해주세요</h1>
         <form action="join.do" method="post">
            <span id="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></span>
            <input type="text" id="user_id" placeholder="아이디" name="user_id" value="${user_id}" />
            <input type="hidden" id="idChecked" name="idChecked" value="<%= request.getAttribute("idChecked") != null ? request.getAttribute("idChecked") : "false" %>">
            <button type="submit" id="btnIDDuplicateCheck"  name="action" value="CheckId">중복확인</button>
            <span id="idCheckResult"><%= request.getAttribute("idCheckResult") != null ? request.getAttribute("idCheckResult") : "" %></span>
            <input type="password" id="password" placeholder="비밀번호" name="password" />
            <input type="password" id="password2" placeholder="비밀번호 확인" name="password2" />
            <span id="passwordCheck"><%= request.getAttribute("passwordCheck") != null ? request.getAttribute("passwordCheck") : "" %></span>
            <input type="text" id="phone" placeholder="휴대폰번호" maxlength="11" name="phone" />
            <input type="text" id="name" placeholder="이름" maxlength="4" name="name" />
            <input type="text" name="email" placeholder="이메일">
            <input type="text" id="birth" placeholder="생년월일 ex)981107" maxlength="6" name="birth" />
            <input type="text" id="addr" placeholder="주소" maxlength="30" name="addr" />
            <button type="submit" name="action" class="but" value="register">다음</button>
         </form>
      </div>
   </div>
   <script>
      // JavaScript validation logic or other interactive features can be added here.
   </script>
</body>
</html>