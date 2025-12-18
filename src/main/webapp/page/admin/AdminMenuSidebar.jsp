
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="sidebar-menu">
        <h2><span class="emoji">⚙️</span> Quản Trị Hệ Thống</h2>

        <div class="menu-group">
            <h3>Người Dùng</h3>
            <a href="${pageContext.request.contextPath}/user-controller" class="menu-link" data-table="users">
                <span class="emoji">🧑‍💻</span> Tài Khoản Khách Hàng
            </a>
            <a href="${pageContext.request.contextPath}/admin/profiles" class="menu-link" data-table="thong_tin_nguoi_dung">
                <span class="emoji">📝</span> Hồ Sơ Cá Nhân
            </a>
        </div>

        <div class="menu-group">
            <h3>Hàng Không</h3>
            <a href="${pageContext.request.contextPath}/admin/flights" class="menu-link" data-table="chuyen_bay">
                <span class="emoji">✈️</span> Quản Lý Chuyến Bay
            </a>
            <a href="${pageContext.request.contextPath}/admin/airlines" class="menu-link" data-table="hang_bay">
                <span class="emoji">🏢</span> Quản Lý Hãng Bay
            </a>
            <a href="${pageContext.request.contextPath}/admin/airports" class="menu-link" data-table="san_bay">
                <span class="emoji">🛫</span> Quản Lý Sân Bay
            </a>
            <a href="${pageContext.request.contextPath}/admin/flight-info" class="menu-link" data-table="gioi_thieu_chuyen_bay">
                <span class="emoji">ℹ️</span> Thông Tin Giới Thiệu
            </a>
        </div>

        <div class="menu-group">
            <h3>Đặt Vé</h3>
            <a href="${pageContext.request.contextPath}/admin/bookings" class="menu-link" data-table="ve_da_dat">
                <span class="emoji">🎟️</span> Đơn Đặt Vé
            </a>
            <a href="${pageContext.request.contextPath}/admin/tickets" class="menu-link" data-table="ve">
                <span class="emoji">🎫</span> Chi Tiết Vé
            </a>
            <a href="${pageContext.request.contextPath}/admin/ticket-types" class="menu-link" data-table="loai_ve">
                <span class="emoji">💺</span> Loại Vé / Hạng Ghế
            </a>
        </div>

        <div class="menu-group">
            <h3>Đối Tác & Đánh Giá</h3>
            <a href="${pageContext.request.contextPath}/admin/agents" class="menu-link" data-table="dai_ly">
                <span class="emoji">🤝</span> Đại Lý
            </a>
            <a href="${pageContext.request.contextPath}/admin/reviews" class="menu-link" data-table="danh_gia_hang_bay">
                <span class="emoji">⭐</span> Đánh Giá Hãng Bay
            </a>
        </div>
    </div>

