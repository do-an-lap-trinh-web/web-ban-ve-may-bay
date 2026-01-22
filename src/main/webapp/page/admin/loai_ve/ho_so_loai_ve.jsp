<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Thông Tin Loại Vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/loai_ve/ho_so_loai_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>
<%@include file="../AdminMenuSidebar.jsp" %>
<div class="container">
    <div class="info-card">
        <h2>Chi Tiết Loại Vé</h2>

        <div class="info-group">
            <div class="info-label">ID Loại Vé</div>
            <div class="info-value">${requestScope.loaiVe.id}</div>
        </div>

        <div class="info-group">
            <div class="info-label">Tên Loại Vé</div>
            <div class="info-value">${requestScope.loaiVe.tenLoaiVe}</div>
        </div>

        <div class="info-group">
            <div class="info-label">Mô Tả</div>
            <div class="info-value description">
                ${requestScope.loaiVe.moTa}
            </div>
        </div>

        <div class="action-area">
            <a href="${pageContext.request.contextPath}/admin/LoaiVe" class="btn-back">← Quay lại danh sách</a>
        </div>
    </div>
</div>
</body>
</html>