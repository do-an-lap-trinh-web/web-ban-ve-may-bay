<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Quản lý User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_users/quan_ly_users.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>

<main>
    <%@include file="../AdminMenuSidebar.jsp" %>
    <div class="main-content">

        <div class="page-header">
            <h1><span class="emoji">🧑‍💻</span> Quản Lý Tài Khoản Người Dùng</h1>
        </div>

        <c:if test="${not empty requestScope.messageXoaUser}">
            <div class="alert-message">
                    ${requestScope.messageXoaUser}
            </div>
        </c:if>

        <div class="toolbar">
            <form action="${pageContext.request.contextPath}/admin/TimKiemUserController" method="get" class="search-form">
                <input type="text" id="searchUser" name="input" placeholder="Tìm kiếm theo Username, Email...">
                <button type="submit" class="btn btn-search">Tìm</button>
            </form>

            <a href="${pageContext.request.contextPath}/page/admin/quan_ly_users/them_user.jsp" class="btn btn-add">
                + Thêm Người Dùng Mới
            </a>
        </div>

        <div class="user-table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Số Điện Thoại</th>
                    <th>Vai Trò</th>
                    <th>Trạng Thái</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td class="font-weight-bold">#${user.id}</td>
                        <td class="username-col">${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.soDienThoai}</td>

                        <td>
                            <c:choose>
                                <c:when test="${user.role == 'admin'}">
                                    <span class="badge badge-admin">Admin</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-user">User</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${user.status == 1}">
                                    <span class="badge badge-active">Hoạt động</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-locked">Đã khóa</span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="action-cell">
                            <a class="btn-action btn-edit" href="${pageContext.request.contextPath}/admin/suaUser?id=${user.id}" title="Sửa">✏️</a>
                            <a class="btn-action btn-profile" href="${pageContext.request.contextPath}/admin/xemHoSo?id=${user.id}" title="Hồ Sơ">👤</a>
                            <a class="btn-action btn-delete" href="${pageContext.request.contextPath}/admin/XoaUser?idUser=${user.id}" title="Xóa" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');">🗑️</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>

</body>
</html>