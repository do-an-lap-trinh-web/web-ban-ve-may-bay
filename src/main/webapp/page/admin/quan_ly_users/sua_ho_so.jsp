<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Sửa Hồ Sơ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_users/sua_ho_so.css">
</head>
<body>
    <div class="container">
        <h2>Chỉnh Sửa Hồ Sơ </h2>

        <form action="${pageContext.request.contextPath}/admin/suaUser" method="post">

            <input type="hidden" name="id" value="${user.id}">

            <div class="form-group">
                <label>Username (Không thể sửa):</label>
                <input type="text" value="${user.username}" disabled style="background: #e9ecef;">
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" value="${user.email}" required>
            </div>
            <div class="form-group">
                <label>Số điện thoại:</label>
                <input type="text" name="soDienThoai" value="${user.soDienThoai}">
            </div>
            <div class="form-group">
                <label>Vai Trò:</label>
                <input type="text" name="role" value="${user.role}">
            </div>

            <hr>

            <div class="form-group">
                <label>Họ và tên:</label>
                <input type="text" name="ho" value="${details.ho}">
            </div>
            <div class="form-group">
                <label>Tên:</label>
                <input type="text" name="ten" value="${details.ten}">
            </div>

            <div class="form-group">
                <label>Giới tính:</label>
                <select name="gioiTinh">
                    <option value="Nam" ${details.gioiTinh == 'Nam' ? 'selected' : ''}>Nam</option>
                    <option value="Nữ" ${details.gioiTinh == 'Nữ' ? 'selected' : ''}>Nữ</option>
                    <option value="Khác" ${details.gioiTinh == 'Khác' ? 'selected' : ''}>Khác</option>
                </select>
            </div>

            <div class="form-group">
                <label>Ngày sinh:</label>
                <input type="date" name="ngaySinh" value="${details.ngaySinh}">
            </div>

            <div class="form-group">
                <label>Địa chỉ:</label>
                <input type="text" name="diaChi" value="${details.diaChi}">
            </div>

            <button type="submit" class="btn-save">Lưu Thay Đổi</button>
            <a href="${pageContext.request.contextPath}/admin/user-controller" class="btn-cancel">Hủy Bỏ</a>
        </form>
    </div>
</body>
</html>
