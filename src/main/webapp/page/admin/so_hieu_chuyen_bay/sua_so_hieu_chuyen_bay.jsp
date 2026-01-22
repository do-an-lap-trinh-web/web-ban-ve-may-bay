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
    <title>Sửa số hiệu chuyến bay</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/admin/so_hieu_chuyen_bay/sua_so_hieu_chuyen_bay.css">
</head>
<body>
<div class="form-container">
    <h2>Sửa số hiệu chuyến bay</h2>

    <form action="${pageContext.request.contextPath}/admin/SuaSoHieuChuyenBayController" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>
        <div>
            <label for="id">ID</label>
            <input type="number" id="id" name="id" value="${soHieuChuyenBay.id}" readonly>
        </div>
        <div>
            <label for="maChuyenBay">Mã chuyến bay</label>
            <input type="text" id="maChuyenBay" name="maChuyenBay" value="${soHieuChuyenBay.maChuyenBay}" required>
        </div>

        <div>
            <label for="idSanBayDi">ID sân bay đi</label>
            <input type="number" id="idSanBayDi" name="idSanBayDi" value="${soHieuChuyenBay.idSanBayDi}" required>
        </div>

        <div>
            <label for="idSanBayDen">ID sân bay đến</label>
            <input type="number" id="idSanBayDen" name="idSanBayDen" value="${soHieuChuyenBay.idSanBayDen}" required>
        </div>
        <div>
            <label for="idHangBay">ID hãng bay</label>
            <input type="text" id="idHangBay" name="idHangBay" value="${soHieuChuyenBay.idHangBay}" required>
        </div>


        <div class="button-group">
            <button type="submit" class="submit-btn">Sửa</button>
            <a href="${pageContext.request.contextPath}/admin/SoHieuChuyenBayController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
