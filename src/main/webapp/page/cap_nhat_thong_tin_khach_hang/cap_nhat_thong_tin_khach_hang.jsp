<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Cập Nhật Thông Tin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/cap_nhat_thong_tin_khach_hang/cap_nhat_thong_tin_khach_hang.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<!--start header-->
<%@ include file="../../layout/Header.jsp" %>
<!--end header-->

<!--update form info-->
<div class="profile-wrapper">
    <div class="profile-card">
        <div class="profile-header">
            <h1>Cập Nhật Thông Tin</h1>
        </div>

        <div class="message-alert">
            ${sessionScope.messageUpdate}
            <c:remove var="messageUpdate" scope="session"/> </div>

        <form action="${pageContext.request.contextPath}/CapNhatThongTinNguoiDungController" method="post" class="form-grid">
            <input type="hidden" name="id" value="${info.id}">
            <input type="hidden" name="idUser" value="${info.idUser}">

            <div class="form-group full-width">
                <label>Email liên hệ</label>
                <input value="${user.email}" id="email" name="email" type="email" placeholder="Nhập email" required>
            </div>

            <div class="form-group">
                <label>Họ và tên đệm</label>
                <input value="${info.ho}" name="ho" type="text" placeholder="VD: Nguyễn Văn">
            </div>
            <div class="form-group">
                <label>Tên</label>
                <input value="${info.ten}" name="ten" type="text" placeholder="VD: A">
            </div>

            <div class="form-group">
                <label>Giới tính</label>
                <select name="gioiTinh">
                    <option value="">--Chọn Giới Tính--</option>
                    <option value="Nam" <c:if test="${info.gioiTinh == 'Nam'}">selected</c:if>>Nam</option>
                    <option value="Nữ" <c:if test="${info.gioiTinh == 'Nữ' || info.gioiTinh == 'Nu'}">selected</c:if>>Nữ</option>
                </select>
            </div>
            <div class="form-group">
                <label>Ngày sinh</label>
                <input value="${info.ngaySinh}" name="ngaySinh" type="date">
            </div>

            <div class="form-group full-width">
                <label>Địa chỉ</label>
                <textarea name="diaChi" placeholder="Nhập địa chỉ cụ thể...">${info.diaChi}</textarea>
            </div>

            <button type="submit" class="btn-action">Hoàn Tất Cập Nhật</button>
        </form>
    </div>
</div>
<!--end update form info-->

<%@ include file="../../layout/Footer.jsp" %>
</body>
</html>