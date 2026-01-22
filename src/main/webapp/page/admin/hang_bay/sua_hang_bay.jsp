
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Sửa Thông Tin Hãng Bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/hang_bay/sua_hang_bay.css">

</head>
<body>
<%@include file="../AdminMenuSidebar.jsp" %>

<div class="main-content">
    <div class="form-container">
        <div class="form-header">
            <h2>✏️ Sửa Thông Tin Hãng Bay</h2>
        </div>

        <form action="${pageContext.request.contextPath}/SuaHangBayController" method="post">
            <div>
                ${requestScope.message}
            </div>
            <div class="form-group">
                <label>ID Hãng Bay</label>
                <input type="text" name="id" value="${hangBay.id}" readonly>
            </div>

            <div class="form-group">
                <label>Tên Hãng Bay</label>
                <input type="text" name="tenHangBay" value="${hangBay.tenHangBay}" placeholder="Nhập tên hãng bay..." required>
            </div>

            <div class="form-group">
                <label>Quốc Gia</label>
                <input type="text" name="quocGia" value="${hangBay.quocGia}" placeholder="Nhập quốc gia..." required>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-save">Cập Nhật Thay Đổi</button>
                <a href="${pageContext.request.contextPath}/HangBayController" class="btn btn-cancel">Hủy Bỏ</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>