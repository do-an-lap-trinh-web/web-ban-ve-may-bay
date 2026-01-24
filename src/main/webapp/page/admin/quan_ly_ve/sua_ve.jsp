<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/7/2026
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa thông tin vé</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/admin/quan_ly_ve/sua_ve.css">
</head>
<body>
<div class="form-container">
    <h2>Sửa Thông tin vé</h2>

    <form action="${pageContext.request.contextPath}/admin/SuaVeController" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>
        <div>
            <label for="id">ID</label>
            <input type="number" id="id" name="id" value="${ve.id}" readonly>
        </div>
        <div>
            <label for="idChuyenBay">ID chuyến bay</label>
            <input type="number" id="idChuyenBay" name="idChuyenBay" value="${ve.idChuyenBay}" required>
        </div>

        <div>
            <label for="idLoaiVe">ID Loại vé</label>
            <input type="number" id="idLoaiVe" name="idLoaiVe" value="${ve.idLoaiVe}" required>
        </div>

        <div>
            <label for="gia">Giá</label>
            <input type="number" id="gia" name="gia" value="${ve.gia}" required>
        </div>
        <div>
            <label for="soLuongTon">Số lượng</label>
            <input type="number" id="soLuongTon" name="soLuongTon" value="${ve.soLuongTon}" required>
        </div>


        <div class="button-group">
            <button type="submit" class="submit-btn">Sửa</button>
            <a href="${pageContext.request.contextPath}/admin/VeController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
