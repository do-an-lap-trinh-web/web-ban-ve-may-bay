<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị - Quản lý Sân bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_san_bay/quan_ly_san_bay.css">
</head>
<body class="bg-light">
<div class="container">
    <h1>Danh sách Sân bay</h1>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sân bay</th>
                        <th>Thành phố</th>
                        <th>Quốc gia</th>
                        <th class="text-center action-col">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        java.util.List<? > sanBays = (java.util.List<? >) request.getAttribute("sanBays");
                        if (sanBays != null && !sanBays.isEmpty()) {
                            for (Object obj : sanBays) {
                                request.setAttribute("sb", obj);
                    %>
                    <tr>
                        <td>${sb.id}</td>
                        <td>${sb.tenSanBay}</td>
                        <td>${sb.thanhPho}</td>
                        <td>${sb.quocGia}</td>
                        <td class="text-center">
                            <a class="btn btn-primary btn-sm"
                               href="${pageContext.request.contextPath}/admin/san-bay/edit? id=${sb.id}">
                                Sửa
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center text-muted">Chưa có sân bay nào. </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>