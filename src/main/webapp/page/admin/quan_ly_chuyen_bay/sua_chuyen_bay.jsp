
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa thông tin chuyến bay</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/admin/quan_ly_chuyen_bay/sua_chuyen_bay.css">
</head>
<body>
<div class="form-container">
    <h2>Sửa Thông tin chuyến bay</h2>

    <form action="${pageContext.request.contextPath}/admin/SuaChuyenBayController" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>
        <div>
            <label for="id">ID</label>
            <input type="number" id="id" name="id" value="${chuyenBay.id}" readonly>
        </div>
        <div>
            <label for="thoiGianKhoiHanh">Thời gian khởi hành</label>
            <input type="datetime-local" id="thoiGianKhoiHanh" name="thoiGianKhoiHanh" value="${chuyenBay.thoiGianKhoiHanh}" required>
        </div>

        <div>
            <label for="thoiGianHaCanh">Thời gian hạ cánh</label>
            <input type="datetime-local" id="thoiGianHaCanh" name="thoiGianHaCanh" value="${chuyenBay.thoiGianHaCanh}" required>
        </div>

        <div>
            <label for="idSoHieuChuyenBay">ID chuyến bay</label>
            <input type="number" id="idSoHieuChuyenBay" name="idSoHieuChuyenBay" value="${chuyenBay.idSoHieuChuyenBay}">
        </div>


        <div class="button-group">
            <button type="submit" class="submit-btn">Sửa</button>
            <a href="${pageContext.request.contextPath}/admin/ChuyenBayController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
