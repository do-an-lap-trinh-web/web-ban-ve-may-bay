<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Quản lý sân bay</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/page/admin/so_hieu_chuyen_bay/so_hieu_chuyen_bay.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>
<%@include file="../AdminMenuSidebar.jsp" %>
<div class="container">
    <div class="search-flight-bar">
        <div class="search-form">
            <form action="" class="search-by-flight-code">
                <input type="text" placeholder="Tìm kiếm theo ID">
                <button type="submit" class="btn-search-from-so-hieu-chuyen-bay">Tìm kiếm</button>
            </form>
        </div>

        <div class="btn-add-ticket-from-so-hieu-chuyen-bay">
            <a href="${pageContext.request.contextPath}/page/admin/quan_ly_san_bay/them_san_bay.jsp" class="btn-add-ticket-from-shcb">
                <span class="btn-add-ticket-icon">+</span>Thêm Sân Bay
            </a>
        </div>
    </div>
    <div>
        <%= request.getAttribute("message")%>
    </div>

    <div class="table-container">
        <table class="example-flights" id="flightTable">
            <thead>
            <tr>
                <th style="text-align: center; width: 60px;">ID</th>
                <th>Tên sân bay</th>
                <th>Thành phố</th>
                <th>Quốc gia</th>
                <th class="action-from-so-hieu-chuyen-bay">Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listSanBay}" var="item">
                <tr class="flight-row">
                    <td style="text-align: center;">${item.id}</td>
                    <td class="flight-code-cell">${item.tenSanBay}</td>
                    <td>${item.thanhPho}</td>
                    <td>${item.quocGia}</td>
                    <td style="display: flex; justify-content: center; gap: 10px;">
                        <a href="${pageContext.request.contextPath}/admin/SuaSanBayController?id=${item.id}" class="action-btn edit">sửa</a>
                        <a href="${pageContext.request.contextPath}">xoá</a>
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
