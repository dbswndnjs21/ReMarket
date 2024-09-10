<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setAttribute("headerTitle", "고객센터");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터 - 다시마켓</title>
    <link rel="stylesheet" type="text/css" href="css/serviceCenter.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <h2>고객센터</h2>

        <div class="service-section">
            <h3>자주 묻는 질문 (FAQ)</h3>
            <div class="faq">
                <div class="faq-item">
                    <h4>Q1. 회원가입은 어떻게 하나요?</h4>
                    <p>A1. 상단의 "회원가입" 버튼을 클릭하여 필요한 정보를 입력하면 회원가입이 완료됩니다.</p>
                </div>
                <div class="faq-item">
                    <h4>Q2. 비밀번호를 잊어버렸어요. 어떻게 해야 하나요?</h4>
                    <p>A2. 로그인 페이지에서 "비밀번호 찾기"를 클릭한 후, 이메일을 통해 비밀번호를 재설정할 수 있습니다.</p>
                </div>
                <!-- 추가적인 FAQ 항목들 -->
            </div>
        </div>

        <div class="service-section">
            <h3>1:1 문의</h3>
            <div class="inquiry-board">
                <div class="inquiry-item">
                    <div class="inquiry-title">문의 제목 예시 1</div>
                    <div class="inquiry-details">2024-07-25 | 답변 대기 중</div>
                </div>
                <div class="inquiry-item">
                    <div class="inquiry-title">문의 제목 예시 2</div>
                    <div class="inquiry-details">2024-07-24 | 답변 완료</div>
                </div>
                <!-- 추가적인 문의 목록 -->
            </div>
            <a href="newInquiry.do" class="inquiry-button">문의하기</a>
        </div>
    </div>
</body>
</html>