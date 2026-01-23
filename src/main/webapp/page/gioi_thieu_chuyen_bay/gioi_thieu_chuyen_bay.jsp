<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị - Giới thiệu Chuyến bay</title>

    <!-- sửa đúng đường dẫn css theo thư mục thật của bạn -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/page/gioi_thieu_chuyen_bay/gioi_thieu_chuyen_bay.css">
</head>
<body class="bg-light">

<div class="container">
    <h1>Danh sách Giới thiệu Chuyến bay</h1>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Hình ảnh</th>
                        <th>Sân bay đi</th>
                        <th>Sân bay đến</th>
                        <th>Mô tả</th>
                        <th class="text-center action-col">Hành động</th>
                    </tr>
                    </thead>

                    <tbody>
                    <%
                        List gioiThieus = (List) request.getAttribute("gioiThieus");

                        if (gioiThieus != null && !gioiThieus.isEmpty()) {
                            for (Object obj : gioiThieus) {
                                // Nếu bạn có class cụ thể, hãy cast đúng class đó ở đây
                                // Ví dụ: GioiThieuChuyenBay gt = (GioiThieuChuyenBay) obj;

                                // Tạm thời dùng reflection kiểu "getXxx" để bạn chạy được ngay cả khi chưa import class:
                                // (Nếu bạn muốn code đẹp/typed, gửi mình tên class model để mình cast chuẩn)
                                Object gt = obj;

                                // Các getter giả định: getId(), getImg(), getTenSanBayDi(), getTenSanBayDen(), getMoTa()
                                // Nếu tên getter của bạn khác, bạn sửa lại đúng theo model.
                                java.lang.reflect.Method mId = gt.getClass().getMethod("getId");
                                java.lang.reflect.Method mImg = gt.getClass().getMethod("getImg");
                                java.lang.reflect.Method mDi = gt.getClass().getMethod("getTenSanBayDi");
                                java.lang.reflect.Method mDen = gt.getClass().getMethod("getTenSanBayDen");
                                java.lang.reflect.Method mMoTa = gt.getClass().getMethod("getMoTa");

                                Object id = mId.invoke(gt);
                                Object img = mImg.invoke(gt);
                                Object tenDi = mDi.invoke(gt);
                                Object tenDen = mDen.invoke(gt);
                                Object moTa = mMoTa.invoke(gt);
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td>
                            <img src="<%=request.getContextPath()%>/<%= img %>" alt="flight" class="img-thumbnail"/>
                        </td>
                        <td><%= tenDi %></td>
                        <td><%= tenDen %></td>
                        <td class="description"><%= moTa %></td>
                        <td class="text-center">
                            <a class="btn btn-primary btn-sm"
                               href="<%=request.getContextPath()%>/admin/gioi-thieu-chuyen-bay/edit?id=<%= id %>">
                                Sửa
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center text-muted">
                            Chưa có giới thiệu chuyến bay nào.
                        </td>
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
