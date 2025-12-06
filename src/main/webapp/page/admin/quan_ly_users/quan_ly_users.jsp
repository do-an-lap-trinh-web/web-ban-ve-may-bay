
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="quan_ly_users.css">
</head>
<body>
<div class="main-content">
    <h1><span class="emoji">🧑‍💻</span> Quản Lý Tài Khoản Người Dùng</h1>

    <div class="toolbar">
        <form action="">
            <input type="text" id="searchUser" placeholder="Tìm kiếm theo Username, Email, SĐT...">
            <button class="btn btn-primary">Tìm</button>
        </form>

        <button class="btn btn-primary">+ Thêm Người Dùng Mới</button>
    </div>

    <div class="user-table-container">
        <table>
            <thead>
            <tr>
                <th>ID User</th>
                <th>Username</th>
                <th>Email</th>
                <th>SĐT</th>
                <th>Ngày Đăng Ký</th>
                <th>code xác thực</th>
                <th>hạn xác thực</th>
                <th>Thao Tác</th>
            </tr>
            </thead>
            <tbody>
            <%-- Dữ liệu được lặp từ Database qua Java/JSTL --%>
            <tr>
                <td>101</td>
                <td>nguyenvanA</td>
                <td>vana@example.com</td>
                <td>0901234567</td>
                <td>2024-01-15</td>
                <td>12345</td>
                <td>còn hạng</td>
                <td>
                    <button >Sửa</button>
                    <button >Hồ Sơ</button>
                    <button >Xóa</button>
                </td>
            </tr>
            <tr>
                <td>102</td>
                <td>lethib</td>
                <td>lethib@mail.com</td>
                <td>0987654321</td>
                <td>2024-03-20</td>
                <td>null</td>
                <td>null</td>
                <td>
                    <button >Sửa</button>
                    <button >Hồ Sơ</button>
                    <button >Xóa</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">&raquo;</a>
    </div>
</div>

<div id="userModal" class="modal">
</div>
</body>
</html>
