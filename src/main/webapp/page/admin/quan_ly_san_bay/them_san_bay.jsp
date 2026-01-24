
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm Sân bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_san_bay/them_san_bay.css">
</head>
<body>
<div class="form-container">
    <h2>Thêm sân bay mới</h2>

    <form action="${pageContext.request.contextPath}/admin/ThemSanBayController" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>

        <div>
            <label for="">Tên sân bay</label>
            <input type="text" id="tenSanBay" name="tenSanBay" placeholder="Nhập tên sân bay" required>
        </div>

        <div>
            <label for="">Thành phố</label>
            <input type="text" id="thanhPho" name="thanhPho" placeholder="Nhập Thành Phố" required>
        </div>

        <div>
            <label for="">Quốc gia</label>
            <input type="text" id="quocGia" name="quocGia" placeholder="Nhập Quốc Gia" required>
        </div>

        <div class="button-group">
            <button type="submit" class="submit-btn">Thêm</button>
            <a href="${pageContext.request.contextPath}/admin/SanBayController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
