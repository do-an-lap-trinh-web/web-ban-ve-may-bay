<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Hãng Bay Mới</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/hang_bay/them_hang_bay.css">
</head>
<body>

<div class="form-container">
    <h2>Thêm Hãng Bay</h2>
    <p class="subtitle">Vui lòng nhập đầy đủ thông tin bên dưới</p>
    <p class="subtitle">${requestScope.message}</p>

    <form action="${pageContext.request.contextPath}/admin/ThemHangBayController" method="post">

        <div class="form-group">
            <label for="tenHang">Tên hãng hàng không</label>
            <input type="text" id="tenHang" name="tenHang" placeholder="Nhập tên hãng..." required>
        </div>

        <div class="form-group">
            <label for="quocGia">Quốc gia</label>
            <input type="text" id="quocGia" name="quocGia" placeholder="Nhập quốc gia..." required>
        </div>

        <div class="btn-group">
            <button type="submit" class="btn-submit">Thêm mới</button>
            <button type="reset" class="btn-reset">Nhập lại</button>
        </div>

    </form>

    <a href="${pageContext.request.contextPath}/admin/HangBayController" class="back-link">← Quay lại danh sách</a>
</div>

</body>
</html>