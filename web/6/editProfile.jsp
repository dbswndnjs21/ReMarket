<%@ page import="dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    UserDto select = (UserDto) request.getAttribute("select");
%>
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
    <jsp:include page="header.jsp" />

    <div class="container clearfix">
        <section class="content">
            <div id="edit-profile" class="form-container">
                <h2>회원 정보 수정</h2>
                <form action="update.do" method="post" >
                    <p><strong>아이디:</strong> <c:out value="<%=select.getUserId()%>"/></p> <!-- 자동 표시, 수정 불가 -->
                    <input type="hidden" name="user_id" value="<%= select.getUserId() %>">
                    <label for="password">새 비밀번호:</label>
                    <input type="password" id="password" name="password" placeholder="새 비밀번호">
                    
                    <label for="confirm-password">비밀번호 확인:</label>
                    <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인">
                    
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" value="<%=select.getName()%>">
                    
                    <label for="birthdate">생년월일:</label>
                    <input type="date" id="birthdate" name="birth" value="<%=select.getBirth()%>">
                    
                    <label for="phone">전화번호:</label>
                    <input type="tel" id="phone" name="phone" value="<%=select.getPhone()%>">
                    
                    <label for="email">이메일:</label>
                    <input type="email" id="email" name="email" value="<%=select.getEmail()%>">
                    
                    <label for="address">주소:</label>
                    <input type="text" id="address" name="addr" value="<%=select.getAddr()%>">
                    
                    <p><strong>가입날짜:</strong> <c:out value="<%=select.getJoinDate()%>"/></p> <!-- 자동 표시, 수정 불가 -->

                    <button type="submit">수정 완료</button>
                    <a href="mypage.jsp" class="cancel-button">취소</a>
                </form>
            </div>
        </section>
    </div>
</body>
</html>