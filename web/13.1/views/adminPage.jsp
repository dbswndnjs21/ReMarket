<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    request.setAttribute("headerTitle", "관리자 페이지");
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <style>
     .container {
            display: flex;
        }
        .sidebar {
            width: 200px;
            
        }
        }
        .content {
            flex: 1;
        }
        iframe {
            width: 100%;
            height: 700px;
            border: none;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/mypage.css">	
    <script>
    	function loadPage(url) {
        	document.getElementById('content-frame').src = url;
    	}
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container clearfix">
        <aside class="sidebar">
            <h2>관리자 페이지</h2>
             <ul>
                <li><a href="javascript:void(0)" onclick="loadPage('memberIndexPage.do')">회원 목록 조회</a></li>
                <li><a href="javascript:void(0)" onclick="loadPage('blameBoardPage.do')">신고 목록 조회</a></li>
                <li><a href="javascript:void(0)" onclick="loadPage('QNAIndexPage.do')">1:1 Q&A 목록 조회</a></li>
            </ul>
        </aside>

        <section class="content">
            <iframe id="content-frame" src="./images/반갑.jpg"></iframe>
       	</section>
    </div>
</body>
</html>