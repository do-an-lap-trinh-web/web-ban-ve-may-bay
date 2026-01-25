<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Đăng ký</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/dang_ky/dang_ky.css">
</head>
<body>

<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<script>
    alert("<%= message %>")
</script>
<%
    }
%>

<a class="link-quay-lai" href="../../index.jsp"> <-- quay lại</a>
<main>
	<div class="main-content">
		<h1 class="title-form">
			ĐĂNG KÝ
		</h1>
		<form action="${pageContext.request.contextPath}/RegisterController" method="post">
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

			<div class="input-form">
				<label>Email</label>
				<div class="input">
					<input name="email" type="email" placeholder="Email">
				</div>
			</div>

			<div class="khoang-cach-form"></div>

			<div class="input-form">
				<label> Số điện thoại</label>
				<div class="input">
					<input name="soDienThoai" type="tel" placeholder="Số Điện thoại">
				</div>
			</div>

			<div class="khoang-cach-form"></div>

			<div class="btn-form">
				<button type="submit">
					Đăng ký
				</button>
			</div>

			<div class="btn-dang-nhap">
				<p>
					Nếu bạn đã có tài khoảng <a href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.jsp">Đăng nhập tại đây</a>
				</p>
			</div>

		</form>
	</div>
</main>
<script src="dang_ky.js"></script>
</body>
</html>