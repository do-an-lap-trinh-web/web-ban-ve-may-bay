<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<title>Thông tin liên hệ</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/page/lien_he/lien_he.css?v=1">
</head>

<body>

<%@include file="../../layout/Header.jsp"%>

<div class="lh-container">
	<h2 class="lh-title">ĐẶT VÉ MÁY BAY SỐ 1 VIỆT NAM</h2>

	<div class="lh-info">
		<div class="lh-item">
			<span class="lh-icon"><i class="fa-solid fa-phone"></i></span>
			<span class="lh-text">935 034 063</span>
		</div>

		<div class="lh-item">
			<span class="lh-icon"><i class="fa-solid fa-envelope"></i></span>
			<span class="lh-text">emailinfo@gmail.com</span>
		</div>

		<div class="lh-item">
			<span class="lh-icon"><i class="fa-solid fa-location-dot"></i></span>
			<span class="lh-text">VQCR+GP6, khu phố 6, Thủ Đức, Thành phố Hồ Chí Minh</span>
		</div>
	</div>
</div>

<div class="lh-map">
	<iframe
			src="https://www.google.com/maps?q=Tr%C6%B0%E1%BB%9Dng%20%C4%90%E1%BA%A1i%20h%E1%BB%8Dc%20N%C3%B4ng%20L%C3%A2m%20TP%20H%E1%BB%93%20Ch%C3%AD%20Minh&output=embed"
			loading="lazy"
			referrerpolicy="no-referrer-when-downgrade"
			allowfullscreen>
	</iframe>
</div>

<%@include file="../../layout/Footer.jsp"%>

</body>
</html>
