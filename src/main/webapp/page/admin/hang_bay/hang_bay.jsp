<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hãng Bay</title>
</head>
<body>
    <div class="container">
        <div class="search-flight-bar">
            <div class="search-form">
                <form action="" class="search-by-flight-name">
                    <input type="text" placeholder="Nhập tên hãng bay (VD: Vietnam Airlines)...">
                    <button type="submit" class="btn-search-from-hang-bay">Tìm kiếm</button>
                </form>
            </div>

            <div class="btn-add-ticket-from-hang-bay">
                <a href="" class="btn-add-ticket-from-hb">
                    <span class="btn-add-ticket-icon">+</span> Thêm Hãng Bay
                </a>
            </div>
        </div>

        <table class="example-flights">
            <thead>
            <tr>
                <th style="text-align: center; width: 60px;">ID</th>
                <th>Tên Hãng Bay</th>
                <th>Quốc Gia</th>
                <th class="action-from-hang-bay">Thao tác</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td style="text-align: center; width: 60px;">1</td>

                <td>Vietnam Airlines</td>

                <td>Việt Nam</td>

                <td>
                    <div class="action-from-hang-bay">
                        <button class="btn-action btn-edit">Sửa</button>
                        <button class="btn-action btn-delete">Xóa</button>
                    </div>
                </td>
            </tr>
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
