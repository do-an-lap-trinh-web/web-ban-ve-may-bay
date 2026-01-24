
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_ve/them_ve.css">
</head>
<body>
<div class="form-container">
    <h2> Thêm một vé mới</h2>
    <div>
        ${requestScope.message}
    </div>
    <form action="${pageContext.request.contextPath}/admin/ThemVeController" method="post">

        <div>
            <label for="idChuyenBay">ID chuyến bay</label>
            <input type="number" id="idChuyenBay" name="idChuyenBay" placeholder="ID chuyến bay"
                   required>
        </div>
        <div>
            <label for="gia">Giá</label>
            <input type="number" id="gia" name="gia" placeholder="Giá"
                   required>
        </div>
        <div>
            <label for="soLuong">Số Lượng</label>
            <input type="number" id="soLuong" name="soLuong" placeholder="Số Lượng"
                   required>
        </div>
        <div>
            <label for="idLoaiVe">ID loại vé</label>
            <input type="number" id="idLoaiVe" name="idLoaiVe" placeholder="ID loại vé"
                   required>
        </div>

        <div class="button-group">
            <button type="submit" class="submit-btn">Thêm vé</button>
            <a href="${pageContext.request.contextPath}/admin/VeController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
