<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 12/13/2025
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="them_ve.css">
</head>
<body>
<div class="form-container">
    <h2> Thêm một vé mới</h2>

    <form action="" method="post">

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
            <a href="quan_ly_ve.jsp" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
