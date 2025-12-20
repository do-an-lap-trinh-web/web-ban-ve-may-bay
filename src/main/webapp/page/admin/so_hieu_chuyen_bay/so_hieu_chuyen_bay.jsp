<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Số Hiệu Chuyến Bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/so_hieu_chuyen_bay/so_hieu_chuyen_bay.css">
</head>
<body>
    <div class="container">
        <div class="search-flight-bar">
            <div class="search-form">
                <form action="" class="search-by-flight-code">
                    <input type="text" placeholder="Nhập mã chuyến bay (VD: VJ101)...">
                    <button type="submit" class="btn-search-from-so-hieu-chuyen-bay">Tìm kiếm</button>
                </form>
            </div>

            <div class="btn-add-ticket-from-so-hieu-chuyen-bay">
                <button class="btn-add-ticket">
                    <span class="btn-add-ticket-icon">+</span>Thêm Chuyến Bay
                </button>
            </div>
        </div>

        <table class="example-flights">
            <thead>
            <tr>
                <th style="text-align: center; width: 60px;">ID</th>
                <th>Mã Chuyến Bay</th>
                <th>ID - Sân Bay Đi</th>
                <th>ID - Sân Bay Đến</th>
                <th>ID - Hãng Bay</th>
                <th class="action-from-so-hieu-chuyen-bay">Thao tác</th>
            </tr>
            </thead>

            <tbody>
            </tbody>
        </table>

        <div class="page-moving">
            <a href="#" class="page-link">&laquo;</a>
            <a href="#" class="page-link active">1</a>
            <a href="#" class="page-link">2</a>
            <a href="#" class="page-link">3</a>
            <a href="#" class="page-link">&raquo;</a>
        </div>
    </div>
</body>
</html>
