<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    request.setAttribute("headerTitle", "상품 게시판");
	%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 등록 - 다시마켓</title>
    <link rel="stylesheet" type="text/css" href="css/writeProduct.css">
    <script type="text/javascript">
        function validateForm() {
            var fileInput = document.getElementById('file1');
            if (!fileInput.value) {
                alert('파일을 첨부해주세요.');
                return false; // 폼 제출을 막음
            }
            return true; // 폼 제출을 허용
        }
    </script>
</head>
<body>
   <jsp:include page="header.jsp" />
	
    <div class="container">
        <div class="content">
            <h2>제품 등록</h2>
            <div class="form-container">
                <form action="writeProduct.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <!-- Hidden field to pass user ID -->
					
                    <!-- Product Title -->
                    <label for="product_name">제목</label>
                    <input type="text" id="product_name" name="productName" required placeholder="제품 제목을 입력하세요">
					
                    <!-- Product Description -->
                    <label for="content">내용</label>
                    <textarea id="description" name="content" rows="5" required placeholder="제품 설명을 입력하세요"></textarea>

                    <!-- Product Price -->
                    <label for="price">가격 (₩)</label>
                    <input type="number" id="price" name="price" required placeholder="가격을 입력하세요" step="1000">
					
                    <!-- Category Selection -->
                    <label for="category">카테고리</label>
                    <select id="category" name="category" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="electronics">전자제품</option>
                        <option value="furniture">가구</option>
                        <option value="clothing">의류</option>
                        <option value="books">도서</option>
                    </select>
					
                    <!-- File Upload -->
                    <label for="file1">첨부파일</label>
                    <input type="file" id="file1" name="file1" accept="image/*">

                    <!-- Submit and Cancel buttons -->
                    <button type="submit">등록</button>
                    <a href="main.jsp" class="cancel-button">취소</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>