<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" type="text/css" href="css/mypage.css">


<%
    int year = 2024;
    int month = 8; // 0 ~ 11

    if(request.getParameter("year") == null || request.getParameter("month") == null) {
        Calendar today = Calendar.getInstance();
        year = today.get(Calendar.YEAR);
        month = today.get(Calendar.MONTH);
    } else {
        year = Integer.parseInt(request.getParameter("year")); // 2022,..
        month = Integer.parseInt(request.getParameter("month")); // 0 ~ 11

        if(month < 0) {
            month = 11;
            year--;
        } else if(month > 11) {
            month = 0;
            year++;
        }
    }

    Calendar firstDate = Calendar.getInstance();
    firstDate.set(Calendar.YEAR, year);
    firstDate.set(Calendar.MONTH, month);
    firstDate.set(Calendar.DATE, 1);
    int firstDay = firstDate.get(Calendar.DAY_OF_WEEK);
    int lastDate = firstDate.getActualMaximum(Calendar.DATE);

    int startBlankCnt = firstDay - 1;
    int endBlankCnt = 0;
    if((startBlankCnt + lastDate) % 7 != 0) {
        endBlankCnt = 7 - (startBlankCnt + lastDate) % 7;
    }
    int tdCnt = startBlankCnt + lastDate + endBlankCnt;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>일정 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        td {
            width: 100px;
            height: 100px;
            text-align: center;
        }
        th {
            height: 30px;
            font-weight: normal;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-3">
    <div class="mt-3 mb-3 p-3 d-flex justify-content-between">
        <a class="btn btn-outline-dark btn-sm" href="<%=request.getContextPath()%>/calendar.jsp?year=<%=year%>&month=<%=month-1%>">[이전달]</a>
        <span class="fw-bold fs-3"><%=year%>년 <%=month+1%>월</span>
        <a class="btn btn-outline-dark btn-sm" href="<%=request.getContextPath()%>/calendar.jsp?year=<%=year%>&month=<%=month+1%>">[다음달]</a>
    </div>
    <table class="table text-left table-bordered">
        <thead>
        <tr class="table-light text-center fs-5">
            <th class="text-danger">일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th class="text-primary">토</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <% for (int i = 1; i <= tdCnt; i++) { %>
            <td>
                <% if (i > startBlankCnt && i <= startBlankCnt + lastDate) { %>
                <%= i - startBlankCnt %>
                <% } else { %>
                &nbsp;
                <% } %>
            </td>
            <% if (i != tdCnt && i % 7 == 0) { %>
        </tr><tr>
            <% } %>
            <% } %>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>



