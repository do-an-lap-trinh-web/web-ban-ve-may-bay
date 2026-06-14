<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thông Tin Khách Hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/thong_tin_khach_hang/thong_tin_khach_hang.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<!--start header-->
<%@include file="../../layout/Header.jsp"%>
<!--end header-->

<!--form info-->
<div class="profile-wrapper">
    <div class="profile-card">
        <div class="profile-header">
            <h1>Thông Tin Hồ Sơ</h1>
        </div>

        <div class="form-grid">
            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" value="${user.username}" disabled>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" value="${user.email == null ? 'Chưa cập nhật' : user.email}" disabled>
            </div>

            <div class="form-group">
                <label>Họ và tên đệm</label>
                <input type="text" value="${info.ho == null ? 'Chưa cập nhật' : info.ho}" disabled>
            </div>
            <div class="form-group">
                <label>Tên</label>
                <input type="text" value="${info.ten == null ? 'Chưa cập nhật' : info.ten}" disabled>
            </div>

            <div class="form-group">
                <label>Giới tính</label>
                <input type="text" value="${info.gioiTinh == null ? 'Chưa cập nhật' : info.gioiTinh}" disabled>
            </div>
            <div class="form-group">
                <label>Ngày sinh</label>
                <input type="text" value="${info.ngaySinh == null ? 'Chưa cập nhật' : info.ngaySinh}" disabled>
            </div>

            <div class="form-group full-width">
                <label>Địa chỉ</label>
                <input type="text" value="${info.diaChi == null ? 'Chưa cập nhật' : info.diaChi}" disabled>
            </div>

            <a href="${pageContext.request.contextPath}/CapNhatThongTinNguoiDungController?id=${info.id}" class="btn-action">Chỉnh Sửa Thông Tin</a>
        </div>
    </div>
</div>

<%@include file="../../layout/Footer.jsp"%>
</body>
</html>