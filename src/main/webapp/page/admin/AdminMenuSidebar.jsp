
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="sidebar-menu">
        <a href="${pageContext.request.contextPath}/admin/user-controller">
            <h2><span class="emoji">⚙️</span> Quản Trị Hệ Thống</h2>
        </a>


        <div class="menu-group">
            <h3>Người Dùng</h3>
            <a href="${pageContext.request.contextPath}/admin/user-controller" class="menu-link" data-table="users">
                <span class="emoji">🧑‍💻</span> Tài Khoản Khách Hàng
            </a>
        </div>

        <div class="menu-group">
            <h3>Hàng Không</h3>
            <a href="${pageContext.request.contextPath}/admin/SoHieuChuyenBayController" class="menu-link" data-table="chuyen_bay">
                <span class="emoji">✈️</span> Quản Lý Số Hiệu Chuyến Bay
            </a>
            <a href="${pageContext.request.contextPath}/admin/HangBayController" class="menu-link" data-table="hang_bay">
                <span class="emoji">🏢</span> Quản Lý Hãng Bay
            </a>
            <a href="${pageContext.request.contextPath}/admin/SanBayController" class="menu-link" data-table="san_bay">
                <span class="emoji">🛫</span> Quản Lý Sân Bay
            </a>
            <a href="${pageContext.request.contextPath}/admin/flight-info" class="menu-link" data-table="gioi_thieu_chuyen_bay">
                <span class="emoji">ℹ️</span> Thông Tin Giới Thiệu
            </a>
        </div>

        <div class="menu-group">
            <h3>Đặt Vé</h3>
            <a href="${pageContext.request.contextPath}/admin/LoaiVe" class="menu-link" data-table="loai_ve">
                <span class="emoji">💺</span> Loại Vé
            </a>
            <a href="${pageContext.request.contextPath}/admin/VeController" class="menu-link" data-table="loai_ve">
                <span class="emoji">💺</span> Danh Sách Ve
            </a>
        </div>
        <div class="menu-group">
            <h3>Trang chủ</h3>
            <a href="${pageContext.request.contextPath}/index.jsp">
                <span style="color: white; padding-left: 20px" class="emoji">⚙️  Trang Chủ</span>
            </a>

        </div>

    </div>

