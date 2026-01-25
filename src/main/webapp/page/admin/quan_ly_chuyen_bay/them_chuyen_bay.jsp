
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm chuyến bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_chuyen_bay/them_chuyen_bay.css">
</head>
<body>
<div class="form-container">
    <h2> Thêm một chuyến bay mới</h2>
    <div>
        ${requestScope.message}
    </div>
    <form action="${pageContext.request.contextPath}/admin/ThemChuyenBayController" method="post">

        <div>
            <label for="thoiGianKhoiHanh">Thời gian khởi hành</label>
            <input type="datetime-local" id="thoiGianKhoiHanh" name="thoiGianKhoiHanh" placeholder="Thời gian khởi hành"
                   required>
        </div>
        <div>
            <label for="thoiGianHaCanh">Thời gian hạ cánh</label>
            <input type="datetime-local" id="thoiGianHaCanh" name="thoiGianHaCanh" placeholder="Thời gian hạ cánh"
                   required>
        </div>
        <div>
            <label for="idSoHieuChuyenBay">ID số hiệu chuyến bay</label>
            <input type="number" id="idSoHieuChuyenBay" name="idSoHieuChuyenBay" placeholder="Id số hiệu chuyến bay"
                   required>
        </div>

        <div class="button-group">
            <button type="submit" class="submit-btn">Thêm Chuyến bay</button>
            <a href="${pageContext.request.contextPath}/admin/ChuyenBayController" class="back-btn">Quay Lại</a>
        </div>
    </form>
</div>
</body>
</html>
