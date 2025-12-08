<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 12/8/2025
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm user</title>
    <link rel="stylesheet" href="them_user.css">
</head>
<body>
<div class="form-container">
    <h2>👤 Đăng Ký Người Dùng Mới</h2>

    <form action="" method="post">

        <div>
            <label for="username">Tên người dùng (**Username**)</label>
            <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
        </div>

        <div>
            <label for="password">Mật khẩu (**Password**)</label>
            <input type="password" id="password" name="password" placeholder="Nhập mật khẩu an toàn" required>
        </div>

        <div>
            <label for="phone">Số điện thoại (**Phone**)</label>
            <input type="tel" id="phone" name="phone" placeholder="Ví dụ: 0901234567" required>
        </div>
        <div>
            <label for="phone">Email (**Email**)</label>
            <input type="email" id="email" name="email" placeholder="Ví dụ: abc@gmail.com" required>
        </div>


        <div class="button-group">
            <button type="submit" class="submit-btn">Tạo Tài Khoản</button>
            <a href="quan_ly_users.jsp" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
