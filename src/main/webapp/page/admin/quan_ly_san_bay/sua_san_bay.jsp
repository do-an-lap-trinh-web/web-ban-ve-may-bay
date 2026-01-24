
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa thông tin sân bay</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/admin/quan_ly_san_bay/sua_san_bay.css">
</head>
<body>
<div class="form-container">
    <h2>Sửa thông tin sân bay</h2>

    <form action="${pageContext.request.contextPath}/admin/SuaSanBayController" method="post">

        <div style="text-align: center">
            <%= request.getAttribute("message") %>
        </div>
        <div>
            <label for="id">ID</label>
            <input type="number" id="id" name="id" value="${sanBay.id}" readonly>
        </div>
        <div>
            <label for="">Tên sân bay</label>
            <input type="text" id="tenSanBay" name="tenSanBay" value="${sanBay.tenSanBay}" required>
        </div>

        <div>
            <label for="idSanBayDi">Thành phố</label>
            <input type="text" id="thanhPho" name="thanhPho" value="${sanBay.thanhPho}" required>
        </div>

        <div>
            <label for="idSanBayDen">Quốc gia</label>
            <input type="text" id="quocGia" name="quocGia" value="${sanBay.quocGia}" required>
        </div>

        <div class="button-group">
            <button type="submit" class="submit-btn">Sửa</button>
            <a href="${pageContext.request.contextPath}/admin/SanBayController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
