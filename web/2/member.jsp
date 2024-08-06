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
html, body {
	width: 100%;
	height: 100%;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	width: 50%;
	background-color: white;
	margin: 100px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.inner {
	margin: 30px;
	width: 100%;
}

h1 {
	margin-bottom: 30px;
	font-size: 30px;
	font-weight: bold;
	color: rgb(63, 63, 63);
	text-align: center;
}

input {
	width: calc(100% - 20px);
	height: 3.75rem;
	padding: 0 10px;
	font-size: 1.3125rem;
	font-weight: 700;
	border: 1px solid rgb(229, 229, 229);
	border-radius: 4px;
	margin-bottom: 20px;
	box-sizing: border-box;
}

button {
	display: inline-flex;
	width: 100%;
	height: 3.75rem;
	border-radius: 4px;
	background-color: rgb(0, 128, 24);
	align-items: center;
	justify-content: center;
	font-size: 1.125rem;
	font-weight: 700;
	color: rgb(255, 255, 255);
	text-align: center;
	border: none;
	cursor: pointer;
	box-sizing: border-box;
}

button:disabled {
	opacity: 0.3;
	cursor: not-allowed;
}

#btnIDDuplicateCheck {
	width: auto;
	height: 3.00rem;
	margin-left: 20px;
}
</style>
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