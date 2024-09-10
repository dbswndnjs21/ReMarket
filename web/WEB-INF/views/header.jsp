<%@ page import="dao.NotificationDao" %>
<%@ page import="dto.NotificationDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // title이라는 속성 값이 없으면 기본값으로 "다시마켓"을 설정
    String headerTitle = (String) request.getAttribute("headerTitle");
    if (headerTitle == null) {
        headerTitle = "다시마켓";
    }

    Boolean hasUnreadMessages = (Boolean) session.getAttribute("hasUnreadMessages");
    if (hasUnreadMessages == null) {
        hasUnreadMessages = false;
    }


    String user_id = (String) session.getAttribute("user_id");
    NotificationDao dao = new NotificationDao();
    ArrayList<NotificationDto> notificationDto = dao.likeSelect(user_id);
    ArrayList<NotificationDto> notificationDto3 = dao.CommentSelect(user_id);

    boolean hasNotifications = (notificationDto != null && !notificationDto.isEmpty()) ||
            (notificationDto3 != null && !notificationDto3.isEmpty() || hasUnreadMessages);


    request.setAttribute("notificationDto", notificationDto);
    request.setAttribute("notificationDto3", notificationDto3);


%>
<header class="header">
    <div class="container">
       <a href="main.do">
        <img src="../images/logo.svg" alt="다시마켓 로고" width="100" class="logo">
        </a>
        <h1><%= headerTitle %>
        </h1>
    </div>
    <div class="icons">
        <a href="message.do">
            <img src="../images/<%= hasUnreadMessages ? "bellon.svg" : "belloff.svg" %>" alt="메시지 아이콘" width="30">
        </a>

        <!-- 로그인한 경우 알림 표시, 안한 경우 로그인 메시지 보여주기 -->
        <c:choose>
            <c:when test="${not empty sessionScope.user_id}">
                <a href="javascript:void(0);" onclick="showNotifications();">
                    <img src="../images/<%= hasNotifications  ? "bell3.svg" : "bell2.svg" %>" alt="알림 벨 아이콘" width="30">
                </a>
            </c:when>
            <c:otherwise>
                <a href="javascript:void(0);" onclick="showLoginMessage();">
                    <img src="../images/belloff1.svg" alt="알림 벨 아이콘" width="30">
                </a>
            </c:otherwise>
        </c:choose>
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
        <div id=right>
        <a href="serviceCenter.do">고객센터</a>
        <%
            String userId = (String) session.getAttribute("user_id");
            if (userId != null) {
                if ("admin".equals(userId)) {
        %>
            <a href="admin.do">관리자페이지</a>
        <%
                } else {
        %>
            <a href="mypage.do">마이페이지</a>
        <%
                }
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


<!-- 알림창 -->
<div id="notification-popup"
     style="display: none; position: fixed; top: 20%; left: 80%; transform: translate(-50%, -50%); width: 400px; background: white; border: 1px solid #ccc; padding: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); z-index: 1000;">
    <h3>알림</h3>
    <ul id="notification-list" style="list-style-type: none; padding: 0">
        <!-- 알림 항목을 여기에 추가 -->
        <li style="position: relative; margin-bottom: 10px;"> <!-- 1. 쪽지 관련 알림을 여기에 추가해주세요. -->
            <c:if test="${true == sessionScope.hasUnreadMessages}">
                <span class="notification-icon">✉️</span>
                <span class="notification-message" style="margin-left: 5px;"></span>
                <a href="message.do">읽지 않은 쪽지가 있습니다😊.</a>
            </c:if>
        </li>

        <%--        <li style="position: relative; margin-bottom: 10px;"> <!-- 2. 판매 게시글 관련 알림을 여기에 추가해주세요. -->--%>
        <%--            <span class="notification-icon">❤️</span>--%>
        <%--            <span class="notification-message" style="margin-left: 5px;">000님이 판매 게시글을 찜했습니다.</span>--%>
        <%--        </li>--%>

        <c:forEach var="notification" items="${notificationDto}">
            <li style="position: relative; margin-bottom: 10px;">
                <span class="notification-icon">❤️</span>
                <span class="notification-message" style="margin-left: 5px;">
            <form action="myWriteList.do" method="post" style="display: inline;">
                <input type="hidden" name="id" value="${notification.id}">
                <button type="submit" style="background: none; border: none; padding: 0; margin: 0; color: inherit; text-decoration: underline; cursor: pointer;">
                        ${notification.content}
                </button>
            </form>
        </span>
            </li>
        </c:forEach>

        <c:forEach var="notification3" items="${notificationDto3}">
            <li style="position: relative; margin-bottom: 10px;">
                <span class="notification-icon">💬</span>
                <span class="notification-message" style="margin-left: 5px;">
                <form action ="board.do" method ="post" style="display: inline;">
                    <button type="submit" style="background: none; border: none; padding: 0; margin: 0; color: inherit; text-decoration: underline; cursor: pointer;">
                        ${notification3.content}
                    </button>
                 </form>
            </li>
        </c:forEach>
    </ul>
    <button style="position:absolute; bottom:10px; right:10px;" onclick="closeNotifications();">닫기</button>
</div>

<!-- 로그인 메시지 표시 -->
<div id="login-message-popup"
     style="display: none; position: fixed; top: 20%; left: 80%; transform: translate(-50%, -50%); width: 400px; background: white; border: 1px solid #ccc; padding: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); z-index: 1000;">
    <h3>알림</h3>
    <p>로그인 후 이용 가능합니다.</p>
    <button style="position: absolute; bottom: 10px; right: 10px;" onclick="closeLoginMessage();">닫기</button>
</div>

<!-- 알림창 JavaScript -->
<script>
    function showNotifications() {
        document.getElementById('notification-popup').style.display = 'block';
        // 서버로부터 알림 데이터를 가져와서 표시하는 코드 추가 가능
    }

    function closeNotifications() {
        document.getElementById('notification-popup').style.display = 'none';
    }

    function showLoginMessage() {
        document.getElementById('login-message-popup').style.display = 'block';
    }

    function closeLoginMessage() {
        document.getElementById('login-message-popup').style.display = 'none';
    }
</script>