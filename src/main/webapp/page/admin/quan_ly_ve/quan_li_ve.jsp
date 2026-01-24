
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Quản Lí Vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_ve/quan_li_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>
<%@ include file="../../admin/AdminMenuSidebar.jsp" %>
    <div class="container">
        <div class="search-flight-bar">
            <div class="search-form">
                <form action="" class="search-by-flight-code">
                    <input type="text" placeholder="Tìm kiếm theo số hiệu chuyến bay (VD: VJ123)...">
                    <button type="submit" class="btn-search-from-quan-li-ve">Tìm kiếm</button>
                </form>
            </div>

            <div class="btn-add-ticket-from-quan-li-ve">
                <button class="btn-add-ticket-from-qlv">
                    <span class="btn-add-ticket-icon">+</span>Thêm vé
                </button>
            </div>
        </div>

        <table class="example-flights">
            <thead>
                <tr>
                    <th style="text-align: center">ID</th>
                    <th style="text-align: center">ID chuyến bay</th>
                    <th style="text-align: center">Loại vé</th>
                    <th style="text-align: center">Giá</th>
                    <th style="text-align: center">Số lượng tồn</th>
                    <th style="text-align: center" class="action-from-quan-li-ve">Thao Tác</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td style="text-align: center" class="flight-code">000</td>
                    <td style="text-align: center">000</td>
                    <td style="text-align: center">Thương gia</td>
                    <td style="text-align: center" class="flight-price">1,200,000đ</td>
                    <td style="text-align: center">Còn 20 vé</td>
                    <td style="text-align: center">
                        <div class="act-btns">
                            <button class="btn-act-edit-del btn-edit">Sửa</button>
                            <button class="btn-act-edit-del btn-delete">Xóa</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>
</body>
</html>
