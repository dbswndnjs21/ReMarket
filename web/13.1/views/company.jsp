<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-08-08
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>다시마켓 회사소개</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        header {
            text-align: center;
            padding: 50px 0;
            background-color: #4CAF50;
            color: white;
        }
        header h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .content {
            padding: 20px;
        }
        .content h2 {
            color: #333;
            font-size: 1.8em;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .content p {
            line-height: 1.6;
            color: #666;
        }
        .content .highlight {
            color: #4CAF50;
            font-weight: bold;
        }
        footer {
            text-align: center;
            padding: 20px 0;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>다시마켓</h1>
        <p>중고장터의 새로운 패러다임</p>
    </header>
    <div class="content">
        <h2>회사 소개</h2>
        <p>다시마켓은 중고 물품을 사고 팔 수 있는 혁신적인 온라인 플랫폼입니다. 우리는 사용자들에게 편리하고 안전한 거래 환경을 제공하기 위해 최선을 다하고 있습니다.</p>
        <p>저희 플랫폼에서는 누구나 쉽게 중고 물품을 <span class="highlight">등록</span>하고 <span class="highlight">구매</span>할 수 있습니다. 또한, 다양한 카테고리와 검색 기능을 통해 원하는 물품을 빠르게 찾을 수 있습니다.</p>
        <p>다시마켓은 고객 만족을 최우선으로 생각하며, 지속적인 서비스 개선과 새로운 기능 추가를 통해 더 나은 거래 경험을 제공하고자 합니다.</p>
    </div>
    <footer>
        &copy; 2024 다시마켓. All rights reserved.
    </footer>
</div>
</body>
</html>
