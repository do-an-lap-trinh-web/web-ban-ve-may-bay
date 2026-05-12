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

<main>
	<div class="main-content">
		<h1 class="title-form">
			ĐĂNG KÝ
		</h1>
		<form action="${pageContext.request.contextPath}/RegisterController" method="post">
			<div class="form-row">
				<div class="form-group">
					<label>Danh xưng</label>
					<select name="danhXung">
						<option value="">Chọn danh xưng</option>
						<option value="Mr">Ông</option>
						<option value="Ms">Bà/Cô</option>
					</select>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Họ <span>(*)</span></label>
					<input type="text" name="ho" placeholder="Họ, ví dụ: PHAM" required>
				</div>
				<div class="form-group">
					<label>Tên đệm & Tên <span>(*)</span></label>
					<input type="text" name="ten" placeholder="Tên đệm & tên" required>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label>Ngày, tháng, năm sinh <span>(*)</span></label>
					<input type="date" name="ngaySinh" required>
				</div>
				<div class="form-group">
					<label>Giới tính <span>(*)</span></label>
					<select name="gioiTinh" required>
						<option value="">Chọn giới tính</option>
						<option value="Nam">Nam</option>
						<option value="Nu">Nữ</option>
					</select>
				</div>
			</div>

			<div class="section-title">Thông tin liên hệ</div>

			<div class="form-row">
				<div class="form-group">
					<label>Email <span>(*)</span></label>
					<input type="email" name="email" placeholder="Email của bạn" required>
				</div>
				<div class="form-group">
					<label>Số điện thoại <span>(*)</span></label>
					<div style="display: flex; gap: 5px;">
						<select style="width: 110px;">
							<option value="+84">+84 (VN)</option>
						</select>
						<input type="tel" name="soDienThoai"
						       placeholder="Số điện thoại"
						       style="flex: 1;"
						       pattern="[0-9]{10,11}"
						       maxlength="11"
						       oninput="this.value = this.value.replace(/[^0-9]/g, '');"
						       required>
					</div>
					<p class="note-text">Vui lòng nhập từ 10-11 chữ số.</p>
				</div>
			</div>

			<div class="section-title">Thông tin đăng nhập</div>
			<div class="form-row">
				<div class="form-group">
					<label>Username <span>(*)</span></label>
					<input type="text" name="username" placeholder="Tên tài khoản" required>
					<p class="note-text">Sử dụng để đăng nhập vào hệ thống.</p>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<label>Mật khẩu <span>(*)</span></label>
					<input type="password" name="password"
					       placeholder="Mật khẩu bảo mật"
					       required
					       pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$">
					<p class="note-text">Mật khẩu từ 8-16 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt.</p>
				</div>
				<div class="form-group">
					<label>Xác nhận mật khẩu <span>(*)</span></label>
					<input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
				</div>
			</div>

			<button type="submit">Đăng ký ngay</button>

			<div class="login-link">
				Nếu bạn đã có tài khoản? <a href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.jsp">Đăng nhập tại đây</a>
			</div>

			<div class="back-button">
				Hoặc <a class="link-quay-lai" href="../../index.jsp">Quay lại trang chủ</a>
			</div>

		</form>
	</div>
</main>
<script src="dang_ky.js"></script>
</body>
</html>