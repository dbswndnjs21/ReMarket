<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // title이라는 속성 값이 없으면 기본값으로 "다시마켓"을 설정
    String headerTitle = (String)request.getAttribute("headerTitle");
    if (headerTitle == null) {
    	headerTitle = "다시마켓";
    }
%>
<header class="header">
    <div class="container">
        <img src="images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
        <h1><%= headerTitle %></h1>
    </div>
     <div class="icons">
        <a href="message.do"> 
            <img src="images/belloff.svg" alt="메시지 아이콘" width="30">
        </a>
        <a href="alram.jsp">
            <img src="images/belloff1.svg" alt="알림 벨 아이콘" width="30">
        </a>
    </div>
</header>

<nav class="nav">
    <div class="container">
        <a href="main.do">홈</a>
        <a href="category.do">카테고리</a>
        <a href="hit.do">인기 상품</a>
        <a href="new.do">최신 상품</a>
        <a href="board.do">자유 게시판</a>
        <a href="writeProduct.do">판매등록</a>
    </div>
    <div>
        <a href="serviceCenter.jsp">고객센터</a>
        <a href="mypage.do">마이페이지</a>
        <%
            if (session.getAttribute("user_id") != null) {
        %>
            <a href="logout.do">로그아웃</a>
        <%
            } else {
        %>
            <a href="login.do">로그인</a>
        <%
            }
        %>
        <a href="join.do">회원가입</a>
    </div>
</nav>