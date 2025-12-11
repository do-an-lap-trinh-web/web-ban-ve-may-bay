<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Hồ Sơ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_users/StyleUpdateUserInfo.css">
</head>
<body>

    <%// Dữ liệu giả định được tải từ database
        String currentUsername = "nguyen_van_a";
        String currentEmail = "nva@example.com";
        String currentPhone = "0987654321";
        String currentHo = "Nguyễn Văn";
        String currentTen = "An";
        String currentNgaySinh = "1995-03-15";
        String currentGioiTinh = "Nam";
        String currentDiaChi = "Số 123, Đường ABC, Phường X, Thành phố Y, Tỉnh Z";
    %>

    <div class="edit-profile-container">
        <h2>Chỉnh Sửa Hồ Sơ</h2>

        <form action="UpdateProfileServlet" method="post">

            <input type="hidden" name="id_user" value="${user.id_user}">

            <div class="section-group">
                <h3>Thông Tin Tài Khoản</h3>

                <div class="input-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= currentUsername %>" readonly>
                </div>

                <div class="input-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" placeholder="Để trống nếu không đổi password" autocomplete="new-password">
                </div>

                <div class="input-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= currentEmail %>" required>
                </div>

                <div class="input-group">
                    <label for="phone">Số Điện Thoại:</label>
                    <input type="tel" id="phone" name="so_dien_thoai" value="<%= currentPhone %>">
                </div>
            </div>

            <div class="section-group">
                <h3>Thông Tin Cá Nhân</h3>

                <div class="name-group">
                    <div class="input-group half-width">
                        <label for="ho">Họ:</label>
                        <input type="text" id="ho" name="ho" value="<%= currentHo %>">
                    </div>
                    <div class="input-group half-width">
                        <label for="ten">Tên:</label>
                        <input type="text" id="ten" name="ten" value="<%= currentTen %>">
                    </div>
                </div>

                <div class="input-group">
                    <label for="ngay_sinh">Ngày Sinh:</label>
                    <input type="date" id="ngay_sinh" name="ngay_sinh" value="<%= currentNgaySinh %>">
                </div>

                <div class="input-group">
                    <label for="gioi_tinh">Giới Tính:</label>
                    <select id="gioi_tinh" name="gioi_tinh">
                        <option value="Nam" <%= currentGioiTinh.equals("Nam") ? "selected" : "" %>>Nam</option>
                        <option value="Nu" <%= currentGioiTinh.equals("Nu") ? "selected" : "" %>>Nữ</option>
                        <option value="Khac" <%= currentGioiTinh.equals("Khac") ? "selected" : "" %>>Khác</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="dia_chi">Địa Chỉ:</label>
                    <textarea id="dia_chi" name="dia_chi" rows="3" placeholder="Nhập địa chỉ chi tiết"><%= currentDiaChi %></textarea>
                </div>
            </div>

            <div class="action-buttons">
                <button type="submit" class="save-btn">Lưu Thay Đổi</button>
                <a href="userProfile.jsp" class="cancel-btn">Hủy Bỏ</a>
            </div>
        </form>
    </div>
</body>
</html>
