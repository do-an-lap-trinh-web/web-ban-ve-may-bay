<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Cập nhật thông tin người dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/cap_nhat_thong_tin_khach_hang/cap_nhat_thong_tin_khach_hang.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<!--start header-->
<%@ include file="../../layout/Header.jsp" %>
<!--end header-->

<!--update form info-->
    <div class="update-user-info">
        <h1 class="title-update-user-info">Cập Nhật Thông Tin</h1>
        <div style="text-align: center">
            ${sessionScope.messageUpdate}
        </div>
        <form action="${pageContext.request.contextPath}/CapNhatThongTinNguoiDungController" method="post">
            <input type="hidden" name="id" value="${info.id}">
            <input type="hidden" name="idUser" value="${info.idUser}">
            <div class="update-form-info">
                <label for="name">Họ và tên</label>
                <div class="input">
                    <input id="name" name="fullName" type="text" placeholder="Nhập họ và tên người dùng"
                        value="${info.ho == null || info.ten == null ? "" : info.ho += ' ' += info.ten}"
                    >
                </div>
            </div>

            <div class="update-form-info">
                <label for="email">Email</label>
                <div class="input">
                    <input value="${user.email == null ? "" : user.email}" id="email" name="email" type="email" placeholder="Nhập email">
                </div>
            </div>
            <div class="update-form-info">
                <label for="ngaySinh">Ngày sinh</label>
                <div class="input">
                    <input value="${info.ngaySinh == null ? "" : info.ngaySinh}" id="ngaySinh" name="ngaySinh" type="date">
                </div>
            </div>

            <div class="update-form-info">
                <label for="gender">Giới tính</label>
                <select id="gender" name="gioiTinh">
                    <option value="">--Chọn Giới Tính--</option>
                    <option value="Nam" <c:if test="${info.gioiTinh == 'Nam'}">selected</c:if>>Nam</option>
                    <option value="Nữ" <c:if test="${info.gioiTinh == 'Nu'}">selected</c:if>>Nữ</option>
                </select>
            </div>

            <div class="update-form-info">
                <label for="address">Địa chỉ</label>
                <div class="textarea">
                    <textarea id="address" name="diaChi" placeholder="Nhập địa chỉ">${info.diaChi == null ? "" : info.diaChi}</textarea>
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