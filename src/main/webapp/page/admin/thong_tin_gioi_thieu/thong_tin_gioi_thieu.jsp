
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý thông tin giới thiệu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/thong_tin_gioi_thieu/thong_tin_gioi_thieu.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>
<%@include file="../AdminMenuSidebar.jsp" %>
<div class="main-content">
    <div class="form-container">
        <div class="form-header">
            <h2><span class="emoji">ℹ️</span> Cấu Hình Thông Tin Giới Thiệu</h2>
            <p>${message}</p>
        </div>

        <form action="UpdateAboutController" method="POST">
            <div class="form-section">
                <div class="form-group">
                    <label>ID Hệ Thống</label>
                    <input type="number" name="id" value="1" readonly>
                </div>

                <div class="row">
                    <div class="form-group col">
                        <label>Địa Chỉ Trụ Sở</label>
                        <input type="text" name="dia_chi" value="${info.dia_chi}" placeholder="Nhập địa chỉ...">
                    </div>
                    <div class="form-group col">
                        <label>Số Điện Thoại</label>
                        <input type="text" name="soDienThoai" value="${info.so_dien_thoai}" placeholder="Nhập SĐT...">
                    </div>
                </div>

                <div class="form-group">
                    <label>Email Liên Hệ</label>
                    <input type="email" name="email" value="${info.email}" placeholder="admin@hcmuaf.edu.vn">
                </div>
            </div>

            <div class="form-section">
                <h3 class="section-title">Liên Kết Mạng Xã Hội</h3>
                <div class="form-group social-input fb">
                    <label>Facebook</label>
                    <input type="url" name="linkFb" value="${info.link_fb}" placeholder="https://facebook.com/...">
                </div>
                <div class="form-group social-input yt">
                    <label>Youtube</label>
                    <input type="url" name="linkYt" value="${info.link_yt}" placeholder="https://youtube.com/...">
                </div>
                <div class="form-group social-input tt">
                    <label>Tiktok</label>
                    <input type="url" name="linkTikTok" value="${info.link_tiktok}" placeholder="https://tiktok.com/...">
                </div>
            </div>

            <div class="button-group">
                <a href="" class="btn btn-back"> Quay lại</a>
                <button type="submit" class="btn btn-update">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>


