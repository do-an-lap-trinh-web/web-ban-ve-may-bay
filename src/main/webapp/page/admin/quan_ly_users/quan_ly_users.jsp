<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Quản lý user</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/quan_ly_users/quan_ly_users.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/admin/StyleAdminMenuSidebar.css">
</head>
<body>

<main>
    <%@include file="../AdminMenuSidebar.jsp" %>
    <div class="main-content">
        <h1><span class="emoji">🧑‍💻</span> Quản Lý Tài Khoản Người Dùng</h1>

        <div class="toolbar">
            <form action="">
                <input type="text" id="searchUser" placeholder="Tìm kiếm theo Username, Email, SĐT...">
                <button class="btn btn-primary">Tìm</button>
            </form>

            <a href="${pageContext.request.contextPath}/page/admin/quan_ly_users/them_user.jsp" class="btn btn-primary">+
                Thêm Người Dùng Mới</a>
        </div>


        <div class="user-table-container">

                <%= request.getAttribute("messageXoaUser")%>


            <table>
                <thead>
                <tr>
                    <th>ID User</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Hạng xác thực</th>
                    <th>code xác thực</th>
                    <th>Thao Tác</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${listUsers}" var="user">
                    <tr>

                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.soDienThoai}</td>
                        <td>${user.hangXacThuc}</td>
                        <td>${user.codeXacThuc}</td>
                        <td>
                            <a class="btn-thao-tac">Sửa</a>
                            <a class="btn-thao-tac" href="${pageContext.request.contextPath}/xemHoSo?id=${user.id}">Hồ Sơ</a>
                            <a class="btn-thao-tac" href="${pageContext.request.contextPath}/XoaUser?idUser=${user.id}">Xóa</a>
                        </td>
                    </tr

                </c:forEach>
                </tbody>
            </table>
        </div>


    </div>
</main>


</body>
</html>
