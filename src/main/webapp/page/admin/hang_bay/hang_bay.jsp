<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hãng Bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/hang_bay/hang_bay.css">
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
            <c:forEach items="${listHangBay}" var="item">
                <tr>
                    <td style="text-align: center; width: 60px;">${item.id}</td>

                    <td>${item.tenHangBay}</td>

                    <td>${item.quocGia}</td>

                    <td>
                        <div class="action-from-hang-bay">
                            <a href="${pageContext.request.contextPath}/SuaHangBayController?id=${item.id}" class="btn-action btn-edit">Sửa</a>
                            <button class="btn-action btn-delete">Xóa</button>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</body>
</html>
