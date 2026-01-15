<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Quên Mật Khẩu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/quen_mat_khau/quen_mat_khau.css">
</head>
<body>
<main>
	<div class="main-content">
		<h1 class="title-form">
			QUÊN MẬT KHẨU
		</h1>
        <div>
            <%= request.getAttribute("message")%>
        </div>
		<form action="${pageContext.request.contextPath}/DoiMatKhauController" method="post">
			<div class="input-form">
				<label>Username</label>
				<div class="input">
					<input name="username" type="text" placeholder="Username"
                           value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : ""%>" required>
				</div>
			</div>

			<div style="height: 20px"></div>

			<div class="input-form">
				<label>Nhập Email Đã Đăng Kí</label>

				<div class="input">
					<input name="email" type="email"
                           value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : ""%>" placeholder="Nhập Email Của Bạn" required>
				</div>

			</div>

			<div style="height: 20px"></div>

			<div class="input-form">
				<label>Mật khẩu mới</label>
				<div class="input">
					<input name="password" type="password"
                           value="<%= request.getAttribute("password") != null ? request.getAttribute("password") : ""%>" placeholder="Mật khẩu mới" required>
				</div>
			</div>

			<div style="height: 20px"></div>

			<div class="form-input-code">
				<label>Mã xác thực</label>

				<div class="input-code">
					<div class="input">
						<input name="code"
                               value="<%= request.getAttribute("maXacThuc") != null ? request.getAttribute("maXacThuc") : ""%>" type="number" placeholder=" Mã xác thực" >
					</div>
					<div class="btn-code">
                        <button type="submit" formaction="${pageContext.request.contextPath}/GuiMaXacThucController" >Gửi Mã</button>
					</div>
				</div>

			</div>

			<div class="btn-form">
				<button type="submit">Gửi Yêu Cầu</button>
			</div>

		</form>

		<div class="btn-quay-lai-dang-nhap">
			<a href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.jsp"> ⬅ Quay Lại Đăng Nhập</a>
		</div>
	</div>
</main>
</body>
</html>