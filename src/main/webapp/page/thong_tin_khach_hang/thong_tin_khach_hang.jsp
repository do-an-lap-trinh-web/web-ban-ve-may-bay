<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông Tin Khách Hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/thong_tin_khach_hang/thong_tin_khach_hang.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp"%>

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

            <div class="form-group full-width">
                <a href="${pageContext.request.contextPath}/CapNhatThongTinNguoiDungController?id=${user.id}" class="btn-action">Chỉnh Sửa Thông Tin</a>
            </div>
        </div>
    </div>

    <div class="profile-card">
        <div class="profile-header">
            <h2>Đổi Mật Khẩu</h2>
        </div>

        <c:if test="${sessionScope.errorPassword != null}">
            <div class="alert-msg alert-error">${sessionScope.errorPassword}</div>
            <c:remove var="errorPassword" scope="session"/>
        </c:if>

        <c:if test="${sessionScope.successPassword != null}">
            <div class="alert-msg alert-success">${sessionScope.successPassword}</div>
            <c:remove var="successPassword" scope="session"/>
        </c:if>

        <form action="${pageContext.request.contextPath}/CapNhatMatKhauController" method="POST">
            <div class="form-group" style="margin-bottom: 20px;">
                <label>Mật khẩu hiện tại</label>
                <input type="password" name="matKhauCu" placeholder="Nhập mật khẩu cũ" required>
            </div>

            <div class="form-group" style="margin-bottom: 20px;">
                <label>Mật khẩu mới</label>
                <input type="password" name="matKhauMoi" placeholder="Nhập mật khẩu mới" required>
            </div>

            <div class="form-group" style="margin-bottom: 30px;">
                <label>Xác nhận mật khẩu mới</label>
                <input type="password" name="xacNhanMatKhau" placeholder="Nhập lại mật khẩu mới" required>
            </div>

            <button type="submit" class="btn-action">Cập Nhật Mật Khẩu</button>
        </form>
    </div>

</div>

<%@include file="../../layout/Footer.jsp"%>
</body>
</html>