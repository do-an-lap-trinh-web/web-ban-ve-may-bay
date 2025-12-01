<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="dang_nhap.css">
</head>
<body>
<a class="link-quay-lai" href="../../index.jsp"> ⬅ Quay Lại</a>
<main>
    <div class="main-content">
        <h1 class="title-form">
            ĐĂNG NHẬP
        </h1>
        <form>
            <div class="input-form">
                <label>Username</label>
                <div class="input">
                    <input name="username" type="text" placeholder="Username">
                </div>
            </div>

            <div class="khoang-cach-form"></div>

            <div class="input-form">
                <label>Password</label>
                <div class="input">
                    <input name="password" type="password" placeholder="Password">
                </div>
            </div>

            <div class="khoang-cach-form"></div>

            <div class="btn-form">
                <button>
                    Đăng Nhập
                </button>
            </div>

            <div class="btn-quen-mat-khau">
	            <a href="../quen_mat_khau/quen_mat_khau.jsp">Quên Mật Khẩu?</a>
            </div>

        </form>
    </div>
</main>

</body>
</html>