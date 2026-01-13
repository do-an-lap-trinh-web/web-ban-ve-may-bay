<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị - Thông tin Đại lý</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/thong_tin_dai_ly/thong_tin_dai_ly.css">
</head>
<body class="bg-light">
<div class="container">
    <h1>Danh sách Đại lý</h1>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Mã</th>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Cập nhật</th>
                        <th class="text-center action-col">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        java.util.List<?> agencies = (java.util.List<?>) request.getAttribute("agencies");
                        if (agencies != null && !agencies.isEmpty()) {
                            for (Object obj : agencies) {
                                // Đặt mỗi phần tử vào attribute 'row' để EL đọc getter: id, code, name, email, phone, address, active, updatedAt
                                request.setAttribute("row", obj);
                    %>
                    <tr>
                        <td>${row.id}</td>
                        <td>${row.code}</td>
                        <td>${row.name}</td>
                        <td>${row.email}</td>
                        <td>${row.phone}</td>
                        <td>${row.address}</td>
                        <td>
                            <%
                                // active là boolean; dùng scriptlet để hiển thị badge
                                try {
                                    java.lang.reflect.Method m = obj.getClass().getMethod("isActive");
                                    boolean active = (boolean) m.invoke(obj);
                                    if (active) {
                            %>
                            <span class="badge badge-success">Hoạt động</span>
                            <%
                            } else {
                            %>
                            <span class="badge badge-secondary">Ngưng</span>
                            <%
                                }
                            } catch (Exception e) {
                            %>
                            <span class="badge badge-secondary">Không rõ</span>
                            <%
                                }
                            %>
                        </td>
                        <td>${row.updatedAt}</td>
                        <td class="text-center">
                            <a class="btn btn-primary btn-sm"
                               href="${pageContext.request.contextPath}/admin/agents/edit?id=${row.id}">
                                Sửa
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="9" class="text-center text-muted">Chưa có đại lý nào.</td>
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