<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Vé đã đặt</title>
</head>
<body>
    <div class="container">

        <div class="searching">
            <div class="search-box">
                <input type="text" placeholder="Tìm theo Tên khách hoặc Mã chuyến...">
                <button class="btn-search">Tìm kiếm</button>
            </div>
        </div>

        <table class="data-table">
            <thead>
            <tr>
                <th style="text-align: center;">Mã Đơn</th>
                <th>Người Đặt</th>
                <th>Chuyến Bay</th>
                <th style="text-align: center;">Số Lượng</th>
                <th>Ngày Đặt</th>
                <th style="text-align: center;">Thao Tác</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td class="id-col">101</td>
                <td>
                    <div class="main-info">Nguyễn Văn A</div>
                </td>
                <td>
                    <div class="main-info">VJ101</div>
                </td>
                <td style="text-align: center; font-weight: bold;">2</td>
                <td>2026-01-10 08:30</td>
                <td class="action-cell">
                    <button class="btn-action btn-detail">Xem</button>
                    <button class="btn-action btn-delete">Hủy</button>
                </td>
            </tr>

            <tr>
                <td class="id-col">102</td>
                <td>
                    <div class="main-info">Trần Thị B</div>
                </td>
                <td>
                    <div class="main-info">VN204</div>
                </td>
                <td style="text-align: center; font-weight: bold;">1</td>
                <td>2025-12-25 14:15</td>
                <td class="action-cell">
                    <button class="btn-action btn-detail">Xem</button>
                    <button class="btn-action btn-delete">Hủy</button>
                </td>
            </tr>

            </tbody>
        </table>

        <div class="pagination">
            <a href="#" class="page-link">&laquo;</a>
            <a href="#" class="page-link active">1</a>
            <a href="#" class="page-link">2</a>
            <a href="#" class="page-link">&raquo;</a>
        </div>
    </div>
</body>
</html>
