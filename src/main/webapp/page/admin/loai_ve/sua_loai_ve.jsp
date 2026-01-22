
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Sửa Thông Tin Loại vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/hang_bay/sua_hang_bay.css">

</head>
<body>
<%@include file="../AdminMenuSidebar.jsp" %>

<div class="main-content">
    <div class="form-container">
        <div class="form-header">
            <h2>✏️ Sửa Thông Tin Loại Vé</h2>
        </div>

        <form action="${pageContext.request.contextPath}/admin/SuaLoaiVeController" method="post">
            <div>
                ${requestScope.message}
            </div>
            <div class="form-group">
                <label>ID Loại vé</label>
                <input type="text" name="id" value="${loaiVe.id}" readonly>
            </div>

            <div class="form-group">
                <label>Tên Loại vé</label>
                <input type="text" name="tenLoaiVe" value="${loaiVe.tenLoaiVe}" placeholder="Nhập tên Loại vé..." required>
            </div>

            <div class="form-group">
                <label>Mô tả</label>
                <input type="text" name="moTa" value="${loaiVe.moTa}" placeholder="Nhập mô tả..." required>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-save">Cập Nhật Thay Đổi</button>
                <a href="${pageContext.request.contextPath}/admin/LoaiVe" class="btn btn-cancel">Hủy Bỏ</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>