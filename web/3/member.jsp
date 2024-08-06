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
				<input type="text" id="member_id" placeholder="아이디" name="id" />
				<button type="button" id="btnIDDuplicateCheck" disabled="disabled" name="btnIDDuplicateCheck">중복확인</button>
				<input type="password" id="password" placeholder="비밀번호" name="pwd" />
				<input type="password" id="password2" placeholder="비밀번호 확인" name="pwd2" />
				<input type="text" id="pnum" placeholder="휴대폰번호" maxlength="11" name="pnum" />
				<input type="text" id="name" placeholder="이름" maxlength="4" name="name" />
				<input type="text" id="birth" placeholder="생년월일 ex)981107" maxlength="6" name="birth" />
				<input type="text" id="address" placeholder="주소" maxlength="30" name="address" />
				<button type="submit" disabled="disabled" class="but">다음</button>
			</form>
		</div>
	</div>
	<script>
		// JavaScript validation logic or other interactive features can be added here.
	</script>
</body>
</html>