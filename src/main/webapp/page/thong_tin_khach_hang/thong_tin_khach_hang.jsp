<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="thong_tin_khach_hang.css">
	<link rel="stylesheet" href="../../layout/StyleHeader.css">
	<link rel="stylesheet" href="../../layout/StyleFooter.css">
</head>
<body>
<!--start header-->
<%@include file="../../layout/Header.jsp"%>
<!--end header-->

<!--form info-->
    <div class="user-info">
        <h1 class="title-form-info">Thông Tin Khách Hàng</h1>
        <div class="info-group">
            <label>Họ và tên</label>
            <div class="info-box">Nguyễn Văn An</div>
        </div>

        <div class="info-group">
            <label>Email</label>
            <div class="info-box">nguyenvanan@gmail.com</div>
        </div>

        <div class="info-group">
            <label>Số điện thoại</label>
            <div class="info-box">0987654321</div>
        </div>

        <div class="info-group">
            <label>Địa chỉ</label>
            <div class="info-box">N30/4 Cách Mạng Tháng 8, TP.HCM</div>
        </div >

        <div class="btn-update">
            <a href="../cap_nhat_thong_tin_khach_hang/cap_nhat_thong_tin_khach_hang.jsp">Cập Nhật Thông Tin</a>
        </div>
    </div>
<!--end form info-->

<%@include file="../../layout/Footer.jsp"%>
</body>
</html>