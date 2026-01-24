<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Loại Vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/loai_ve/loai_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>
<%@include file="../AdminMenuSidebar.jsp" %>

<div class="container">
    <div class="search-ticket-bar">
        <div class="search-form">
            <form action="${pageContext.request.contextPath}/admin/TimKiemLoaiVeController" method="get" class="search-by-ticket-id">
                <input type="text" name="input" placeholder="Nhập ID loại vé">
                <button type="submit" class="btn-search-from-loai-ve">Tìm kiếm</button>
            </form>
        </div>

        <div class="btn-add-ticket-from-loai-ve">
            <a href="${pageContext.request.contextPath}/page/admin/loai_ve/them_loai_ve.jsp" class="btn-add-ticket-from-lv">
                <span class="btn-add-ticket-icon">+</span>Thêm Loại Vé
            </a>
        </div>
    </div>

    <table class="example-tickets">
        <%= request.getAttribute("message")%>
        <thead>
        <tr>
            <th style="text-align: center; width: 60px;">ID</th>
            <th style="text-align: center;">Tên loại vé</th>
            <th style="text-align: center;">Mô tả</th>
            <th style="text-align: center;" class="action-from-loai-ve">Thao tác</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${listLoaiVe}" var="loaiVe">
            <tr style="padding-top: 30px; padding-bottom: 30px">

                <td class="text-3cham">${loaiVe.id}</td>
                <td class="text-3cham">${loaiVe.tenLoaiVe}</td>
                <td class="text-3cham">${loaiVe.moTa}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/SuaLoaiVeController?id=${loaiVe.id}" class="btn-thao-tac">Sửa</a>
                    <a href="${pageContext.request.contextPath}/admin/XemHoSoLoaiVeController?id=${loaiVe.id}" class="btn-thao-tac">Hồ Sơ</a>
                    <a class="btn-thao-tac" href="${pageContext.request.contextPath}/admin/XoaLoaiVe?idLoaiVe=${loaiVe.id}">Xóa</a>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>


</div>
</body>
</html>
