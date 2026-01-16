<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Xem Hồ Sơ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_users/xem_ho_so.css">
</head>
<body>
    <div class="container">
        <div class="header">Chi Tiết Hồ Sơ</div>

        <c:if test="${not empty user}">
            <div class="content">
                <div class="section-title">Thông Tin Tài Khoản</div>

                <div class="info-row">
                    <span class="label">ID:</span>
                    <span class="value">${user.id}</span>
                </div>
                <div class="info-row">
                    <span class="label">Tên đăng nhập:</span>
                    <span class="value">${user.username}</span>
                </div>
                <div class="info-row">
                    <span class="label">Email:</span>
                    <span class="value">${user.email}</span>
                </div>
                <div class="info-row">
                    <span class="label">Số điện thoại:</span>
                    <span class="value">${user.soDienThoai}</span>
                </div>
                <div class="info-row">
                    <span class="label">Vai trò:</span>
                    <span class="value">${user.role}</span>
                </div>

                <div class="section-title">Thông Tin Cá Nhân</div>

                <c:choose>
                    <c:when test="${not empty details}">
                        <div class="info-row">
                            <span class="label">Họ và tên:</span>
                            <span class="value">${details.ho} ${details.ten}</span>
                        </div>
                        <div class="info-row">
                            <span class="label">Giới tính:</span>
                            <span class="value">${details.gioiTinh}</span>
                        </div>
                        <div class="info-row">
                            <span class="label">Ngày sinh:</span>
                            <span class="value">${details.ngaySinh}</span>
                        </div>
                        <div class="info-row">
                            <span class="label">Địa chỉ:</span>
                            <span class="value">${details.diaChi}</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert-warning" style="width: 100%;">
                            Người dùng này chưa cập nhật thông tin cá nhân chi tiết.
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="btn-container">
                    <a href="${pageContext.request.contextPath}/admin/quan-ly-users" class="btn btn-back">Quay lại</a>
                    <a href="${pageContext.request.contextPath}/admin/sua-user?id=${user.id}" class="btn btn-edit">Chỉnh sửa</a>
                </div>
            </div>
        </c:if>

        <c:if test="${empty user}">
            <div class="alert-warning">Không tìm thấy thông tin người dùng!</div>
            <div class="btn-container">
                <a href="${pageContext.request.contextPath}/admin/quan-ly-users" class="btn btn-back">Quay lại danh sách</a>
            </div>
        </c:if>
    </div>
</body>
</html>
