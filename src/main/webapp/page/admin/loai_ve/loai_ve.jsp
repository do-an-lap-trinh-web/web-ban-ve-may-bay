<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Loại Vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/loai_ve/loai_ve.css">
</head>
<body>
<div class="container">
    <div class="search-ticket-bar">
        <div class="search-form">
            <form action="" class="search-by-ticket-id">
                <input type="text" placeholder="Nhập ID loại vé">
                <button type="submit" class="btn-search-from-loai-ve">Tìm kiếm</button>
            </form>
        </div>

        <div class="btn-add-ticket-from-loai-ve">
            <button class="btn-add-ticket-from-lv">
                <span class="btn-add-ticket-icon">+</span>Thêm Loại Vé
            </button>
        </div>
    </div>

    <table class="example-tickets">
        <thead>
        <tr>
            <th style="text-align: center; width: 60px;">ID</th>
            <th>Tên loại vé</th>
            <th>Mô tả</th>
            <th class="action-from-loai-ve">Thao tác</th>
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
