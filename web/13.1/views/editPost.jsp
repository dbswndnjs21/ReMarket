<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dto.ProductDto, dto.FileDto" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정 - 다시마켓</title>
    <link rel="stylesheet" type="text/css" href="css/writeProduct.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="content">
            <h2>게시글 수정</h2>
            <div class="form-container">
                <form action="editPost.do" method="post" enctype="multipart/form-data">
                    <!-- Hidden field to pass product ID -->
                    <input type="hidden" name="productId" value="${to.productId}">
                    
                    <!-- Product Title -->
                    <label for="product_name">제목</label>
                    <input type="text" id="product_name" name="productName" value="${to.productName}" required placeholder="제품 제목을 입력하세요">
                    
                    <!-- Product Description -->
                    <label for="content">내용</label>
                    <textarea id="description" name="content" rows="5" required placeholder="제품 설명을 입력하세요">${to.content}</textarea>

                    <!-- Product Price -->
                    <label for="price">가격 (₩)</label>
                    <input type="number" id="price" name="price" value="${to.price}" required placeholder="가격을 입력하세요" step="1000">
                    
                    <!-- Category Selection -->
                    <label for="category">카테고리</label>
                    <select id="category" name="category" required>
                        <option value="">카테고리를 선택하세요</option>
                        <option value="electronics" ${to.category == 'electronics' ? 'selected' : ''}>전자제품</option>
                        <option value="furniture" ${to.category == 'furniture' ? 'selected' : ''}>가구</option>
                        <option value="clothing" ${to.category == 'clothing' ? 'selected' : ''}>의류</option>
                        <option value="books" ${to.category == 'books' ? 'selected' : ''}>도서</option>
                    </select>
               
                    <!-- File Upload -->
                    <label for="file1">첨부파일</label>
                    <input type="file" id="file1" name="file1" accept="image/*">
                    
                    <!-- Existing files -->
                    <c:if test="${not empty to.files}">
                        <label>현재 첨부파일:</label>
                        <c:forEach var="file" items="${to.files}">
                            <div>
                                <img src="./upload/${file.saveFileName}" alt="첨부파일" width="100">
                                <p>${file.fileName}</p>
                                
                            </div>
                        </c:forEach>
                    </c:if>

                    <!-- Submit and Cancel buttons -->
                    <button type="submit">수정</button>
                    <a href="main.do" class="cancel-button">취소</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>