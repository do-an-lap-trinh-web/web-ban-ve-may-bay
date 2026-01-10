<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
    <link rel="stylesheet" href="cap_nhat_thong_tin_khach_hang.css">
	<link rel="stylesheet" href="../../layout/StyleHeader.css">
	<link rel="stylesheet" href="../../layout/StyleFooter.css">
</head>
<body>
<!--start header-->
<%@ include file="../../layout/Header.jsp" %>
<!--end header-->

<!--update form info-->
    <div class="update-user-info">
        <h1 class="title-update-user-info">Cập Nhật Thông Tin</h1>
        <form>
            <div class="update-form-info">
                <label for="name">Họ và tên</label>
                <div class="input">
                    <input id="name" name="update-user-name-info" type="text" placeholder="Nhập họ và tên người dùng">
                </div>
            </div>

            <div class="update-form-info">
                <label for="email">Email</label>
                <div class="input">
                    <input id="email" name="update-email-info" type="email" placeholder="Nhập email">
                </div>
            </div>

            <div class="update-form-info">
                <label for="phone">Số điện thoại</label>
                <div class="input">
                    <input id="phone" name="update-tel-info" type="tel" placeholder="Nhập số điện thoại">
                </div>
            </div>

            <div class="update-form-info">
                <label for="gender">Giới tính</label>
                <select id="gender" name="update-gender">
                    <option value="">--Chọn Giới Tính--</option>
                    <option value="">Nam</option>
                    <option value="">Nữ</option>
                </select>
            </div>

            <div class="update-form-info">
                <label for="address">Địa chỉ</label>
                <div class="textarea">
                    <textarea id="address" name="update-address-info" placeholder="Nhập địa chỉ"></textarea>
                </div>
            </div>

            <div class="btn-form-update">
                <button type="submit">Hoàn Tất Cập Nhật</button>
            </div>
        </form>
    </div>
<!--end update form info-->

<%@ include file="../../layout/Footer.jsp" %>
</body>
</html>