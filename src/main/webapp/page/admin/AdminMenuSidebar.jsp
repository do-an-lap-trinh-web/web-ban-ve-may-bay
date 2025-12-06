
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Demo Giao Diện Admin Sidebar</title>
    <style>
        .sidebar-menu {
            width: 260px;
            height: 100vh;
            background-color: #1a1a2e;
            color: #bdc3c7;
            padding-top: 25px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            overflow-y: auto;
            font-family: sans-serif;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.3);
        }
        .sidebar-menu h2 {
            text-align: center;
            margin: 0 0 25px 0;
            color: #ffffff;
            font-size: 23px;
            font-weight: 600;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 20px;
        }
        .menu-group {
            margin-bottom: 25px;
            padding: 0 15px;
        }
        .menu-group h3 {
            color: #57606f;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 12px;
            padding-left: 10px;
            font-weight: 600;
        }
        .sidebar-menu a.menu-link {
            display: flex;
            align-items: center;
            color: #a4b0be;
            text-decoration: none;
            padding: 12px 15px;
            margin-bottom: 5px;
            border-radius: 6px;
            transition: all 0.2s;
            font-size: 15px;
            border-left: 3px solid transparent;
        }
        .sidebar-menu a.menu-link:hover {
            background-color: rgba(255, 255, 255, 0.05);
            color: #ffffff;
        }
        .sidebar-menu a.menu-link span {
            margin-right: 12px;
            font-size: 19px;
            color: #f1c40f;
            opacity: 0.8;
        }
        .sidebar-menu a.menu-link.active {
            background-color: rgba(52, 152, 219, 0.15);
            color: #ffffff;
            border-left-color: #3498db;
            font-weight: 600;
        }
        .sidebar-menu a.menu-link.active span {
            color: #3498db;
            opacity: 1;
        }
    </style>
</head>
<body>
    <div class="sidebar-menu">
        <h2><span class="emoji">⚙️</span> Quản Trị Hệ Thống</h2>

        <div class="menu-group">
            <h3>Người Dùng</h3>
            <a href="${pageContext.request.contextPath}/admin/users" class="menu-link" data-table="users">
                <span class="emoji">🧑‍💻</span> Tài Khoản Khách Hàng
            </a>
            <a href="${pageContext.request.contextPath}/admin/profiles" class="menu-link" data-table="thong_tin_nguoi_dung">
                <span class="emoji">📝</span> Hồ Sơ Cá Nhân
            </a>
        </div>

        <div class="menu-group">
            <h3>Hàng Không</h3>
            <a href="${pageContext.request.contextPath}/admin/flights" class="menu-link active" data-table="chuyen_bay">
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
</body>
</html>
