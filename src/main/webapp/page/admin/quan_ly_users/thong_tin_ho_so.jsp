<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông Tin Hồ Sơ</title>
    <link rel="stylesheet" type="text/css" href="thong_tin_ho_so.css">
</head>
<body>
<h2 class="profile-title">Thông Tin Hồ Sơ</h2>
<div class="profile-section">
    <div class="section-heading">
        <span class="icon">🔑</span>
        <span>Thông Tin Tài Khoản</span>
    </div>
    <div class="section-row">
        <span>Username:</span>
        <span class="section-value">${user.username}</span>
    </div>
    <div class="section-row">
        <span>Email:</span>
        <span class="section-value">${user.email}</span>
    </div>
    <div class="section-row">
        <span>Số Điện Thoại:</span>
        <span class="section-value">${user.soDienThoai}</span>
    </div>
</div>

<div class="profile-section">
    <div class="section-heading">
        <span class="icon">📝</span>
        <span>Thông Tin Cá Nhân Chi Tiết</span>
    </div>
    <div class="section-row">
        <span>Họ và Tên:</span>
        <span class="section-value">${thongTinNguoiDung.ho} ${thongTinNguoiDung.ten}</span>
    </div>
    <div class="section-row">
        <span>Mã Định Danh (ID Người Dùng):</span>
        <span class="section-value">${thongTinNguoiDung.idNguoiDung}</span>
    </div>
    <div class="section-row">
        <span>Ngày Sinh:</span>
        <span class="section-value">${thongTinNguoiDung.ngaySinh}</span>
    </div>
    <div class="section-row">
        <span>Giới Tính:</span>
        <span class="section-value">${thongTinNguoiDung.gioiTinh}</span>
    </div>
    <div class="section-row">
        <span>Địa Chỉ:</span>
        <span class="section-value">${thongTinNguoiDung.diaChi}</span>
    </div>
</div>

<div class="profile-actions">
    <button class="btn-edit">Chỉnh Sửa Hồ Sơ</button>
    <button class="btn-back">Quay Lại</button>
</div>
</body>
</html>