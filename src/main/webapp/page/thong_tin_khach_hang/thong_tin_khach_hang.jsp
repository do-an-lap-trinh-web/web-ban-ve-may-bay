<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/thong_tin_khach_hang/thong_tin_khach_hang.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
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
            <div class="info-box">
                <c:if test="${info.ho == null || info.ten == null}">
                    <span>
                        chưa có
                    </span>
                </c:if>
                <c:if test="${info.ho != null && info.ten != null}">
                    <span>
                            ${info.ho}
                    </span>
                    <span>
                            ${info.ten}
                    </span>
                </c:if>

            </div>
        </div>

        <div class="info-group">
            <label>Email</label>
            <div class="info-box">${user.email == null ? "chưa có" : user.email}</div>
        </div>
        <div class="info-group">
            <label>Giới tính</label>
            <div class="info-box">${info.gioiTinh == null ? "chưa có" : info.gioiTinh}</div>
        </div>
        <div class="info-group">
            <label>Ngày sinh</label>
            <div class="info-box">${info.ngaySinh == null ? "chưa có" : info.ngaySinh}</div>
        </div>

        <div class="info-group">
            <label>Địa chỉ</label>
            <div class="info-box">${info.diaChi == null ? "chưa có" : info.diaChi}</div>
        </div >

        <div class="btn-update">
            <a href="../cap_nhat_thong_tin_khach_hang/cap_nhat_thong_tin_khach_hang.jsp">Cập Nhật Thông Tin</a>
        </div>
    </div>

<%@include file="../../layout/Footer.jsp"%>
</body>
</html>