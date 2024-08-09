<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
    function openMap() {
        window.open('map.do', '_blank', 'width=800,height=600');
    }
</script>
<style>
    /* 푸터 스타일 추가 */
    .footer {
        background-color: #f8f9fa;
        padding: 20px;
        border-top: 1px solid #e9ecef;
        position: relative;
    }

    .footer-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .footer-section {
        flex: 1;
        margin: 10px;
    }

    .footer-section h3 {
        margin-bottom: 10px;
    }

    .footer-section p, .footer-section ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .footer-section ul li {
        margin-bottom: 5px;
    }

    .footer-section ul li a {
        text-decoration: none;
        color: #007bff;
    }

    .footer-section ul li a:hover {
        text-decoration: underline;
    }

    .social-icon {
        width: 24px;
        height: 24px;
        margin-right: 10px;
    }

    .footer-bottom {
        text-align: center;
        padding: 10px 0;
        background-color: #e9ecef;
        border-top: 1px solid #dee2e6;
    }
</style>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>회사 정보</h3>
            <p>대표: 이유현</p>
            <p>직원: 최이재</p>
            <p>다시마켓은 여러분의 생활을 더 편리하게 만들어 드리기 위해 노력합니다.</p>
        </div>
        <div class="footer-section">
            <h3>연락처</h3>
            <p>전화: 123-456-7890</p>
            <p>이메일: contact@dasi-market.com</p>
            <a href="javascript:void(0);" onclick="openMap()">서울특별시 종로구 율곡로10길 105</a>
        </div>
        <div class="footer-section">
            <h3>링크</h3>
            <ul>
                <li><a href="company.do">회사 소개</a></li>
                <li><a href="serviceCenter.do">고객센터</a></li>
                <li><a href="policy.do">개인정보 처리방침</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>소셜 미디어</h3>
            <a href="https://facebook.com/dasi-market" target="_blank">
                <img src="<%=request.getContextPath()%>/images/facebook.png" alt="Facebook" class="social-icon">
            </a>
            <a href="https://twitter.com/dasi-market" target="_blank">
                <img src="<%=request.getContextPath()%>/images/twitter.png" alt="Twitter" class="social-icon">
            </a>
            <a href="https://instagram.com/dasi-market" target="_blank">
                <img src="<%=request.getContextPath()%>/images/instargram.png" alt="Instagram" class="social-icon">
            </a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 다시마켓. All rights reserved.</p>
    </div>
</footer>