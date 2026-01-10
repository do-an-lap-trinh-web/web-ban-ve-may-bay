
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Web bán vé máy bay</title>
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="layout/StyleHeader.css">
	<link rel="stylesheet" href="layout/StyleFooter.css">
</head>

<body>
<%
    String messageLogin = (String) request.getAttribute("messageLogin");
    if (messageLogin != null) {
%>
<script>
    alert("<%= messageLogin %>")
</script>
<%
    }
%>
<%@ include file="layout/Header.jsp"%>

<!-- ✅ NỘI DUNG TRANG CHỦ -->
<div>
    <div class="container">
		<div class="title-selection">
			<h1>Chuyến bay nội địa nổi bật</h1>
		</div>

		<div class="list-card-selection">
			<div class="card-selection">
				<img src="access/trang_chu/anh-ho-guom.webp" alt="">
				<p>Vé máy bay đi Hà Nội</p>
				<span>800.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-sai-gon.webp" alt="">
				<p>Vé máy bay đi TP.HCM</p>
				<span>1.200.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-da-nang.webp" alt="">
				<p>Vé máy bay đi Đà Nẵng</p>
				<span>800.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-hue.webp" alt="">
				<p>Vé máy bay đi Huế</p>
				<span>800.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-nha-trang.webp" alt="">
				<p>Vé máy bay đi Nha Trang</p>
				<span>800.000đ</span>
			</div>
		</div>

		<div class="btn-dat-ve-selection">
			<a href="page/tim_ve/tim_ve.jsp">Đặt vé</a>
		</div>

	</div>

	<div class="container">

		<div class="title-selection">
			<h1>Chuyến bay nội địa nổi bật</h1>
		</div>

		<div class="list-card-selection">
			<div class="card-selection">
				<img src="access/trang_chu/anh-uc.webp" alt="">
				<p>Vé máy bay đi Úc</p>
				<span>800.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-phap.webp" alt="">
				<p>Vé máy bay đi Pháp</p>
				<span>1.200.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-mi.webp" alt="">
				<p>Vé máy bay đi Mĩ</p>
				<span>800.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-singapore.webp" alt="">
				<p>Vé máy bay đi Singapore</p>
				<span>800.000đ</span>
			</div>

			<div class="card-selection">
				<img src="access/trang_chu/anh-nhat-ban.webp" alt="">
				<p>Vé máy bay đi Nhật Bản</p>
				<span>800.000đ</span>
			</div>
		</div>

		<div class="btn-dat-ve-selection">
			<a href="page/tim_ve/tim_ve.jsp">Đặt vé</a>
		</div>

	</div>
</div>


<%@ include file="layout/Footer.jsp"%>


</body>
</html>
