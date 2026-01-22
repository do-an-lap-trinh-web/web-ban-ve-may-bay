<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 1/7/2026
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm Chuyến Bay Mới</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/admin/so_hieu_chuyen_bay/them_so_hieu_chuyen_bay.css">
</head>
<body>
<div class="form-container">
    <h2>Thêm số hiệu chuyến bay mới</h2>

    <form action="${pageContext.request.contextPath}/admin/SoHieuChuyenBayController" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>
        <div>
            <label for="maChuyenBay">Mã chuyến bay</label>
            <input type="text" id="maChuyenBay" name="maChuyenBay" placeholder="Nhập mã chuyến bay" required>
        </div>

        <div>
            <label for="idSanBayDi">ID sân bay đi</label>
            <input type="number" id="idSanBayDi" name="idSanBayDi" placeholder="Nhập id sân bay đi" required>
        </div>

        <div>
            <label for="idSanBayDen">ID sân bay đến</label>
            <input type="number" id="idSanBayDen" name="idSanBayDen" placeholder="Nhập id sân bay đến" required>
        </div>
        <div>
            <label for="idHangBay">ID hãng bay</label>
            <input type="text" id="idHangBay" name="idHangBay" placeholder="Nhập id hãng bay" required>
        </div>


        <div class="button-group">
            <button type="submit" class="submit-btn">Thêm</button>
            <a href="${pageContext.request.contextPath}/admin/SoHieuChuyenBayController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
