<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Sân Bay</title>

    <!-- CHỈ DÙNG CSS RIÊNG -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/quan_ly_san_bay/quan_ly_san_bay.css">
</head>

<body>

<div class="container">

    <div class="card page">
        <div class="page-header">
            <div>
                <h1 class="page-title">Quản lý Sân Bay</h1>
                <p class="page-sub">Danh sách sân bay</p>
            </div>

            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/page/quan_ly_san_bay/them_san_bay.jsp">
                + Thêm sân bay
            </a>
        </div>

        <div class="toolbar">
            <form class="search" method="get">
                <input type="text" name="q"
                       placeholder="Tìm theo tên sân bay / thành phố / quốc gia"
                       value="${param.q}">
                <button class="btn btn-light" type="submit">Tìm</button>
            </form>

            <div class="msg">${requestScope.message}</div>
        </div>

        <div class="table-wrap">
            <table class="table">
                <thead>
                <tr>
                    <th style="width:80px;">ID</th>
                    <th>Tên sân bay</th>
                    <th>Thành phố</th>
                    <th>Quốc gia</th>
                    <th style="width:160px; text-align:right;">Thao tác</th>
                </tr>
                </thead>

                <tbody>
                <c:if test="${empty listSanBay}">
                    <tr>
                        <td class="mono">1</td>
                        <td>Nội Bài (HAN)</td>
                        <td>Hà Nội</td>
                        <td>Việt Nam</td>
                        <td class="actions">
                            <a class="btn btn-small btn-warn" href="#">Sửa</a>
                            <a class="btn btn-small btn-danger" href="#">Xóa</a>
                        </td>
                    </tr>
                </c:if>

                <c:forEach var="sb" items="${listSanBay}">
                    <tr>
                        <td class="mono">${sb.id}</td>
                        <td>${sb.tenSanBay}</td>
                        <td>${sb.thanhPho}</td>
                        <td>${sb.quocGia}</td>
                        <td class="actions">
                            <a class="btn btn-small btn-warn"
                               href="${pageContext.request.contextPath}/SuaSanBay?id=${sb.id}">Sửa</a>
                            <a class="btn btn-small btn-danger"
                               href="${pageContext.request.contextPath}/XoaSanBay?id=${sb.id}">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>


</body>
</html>
