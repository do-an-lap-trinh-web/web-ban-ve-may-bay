<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 12/22/2025
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm loại vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/loai_ve/them_loai_ve.css">
</head>
<body>
<div class="form-container">
    <h2>👤 Đăng Ký Người Dùng Mới</h2>

    <form action="${pageContext.request.contextPath}/LoaiVe" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>

        <div>
            <label for="">Tên Loại vé</label>
            <input type="text" id="tenLoaiVe" name="tenLoaiVe" placeholder="Nhập tên loại vé" required>
        </div>
        <div>
            <label for="">Mô tả</label>
            <input type="text" id="moTa" name="moTa" placeholder="Nhập mô tả" required>
        </div>

        <div class="button-group">
            <button type="submit" class="submit-btn">Thêm</button>
            <a href="${pageContext.request.contextPath}/LoaiVe" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
