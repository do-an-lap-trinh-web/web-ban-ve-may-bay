<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<link rel="stylesheet" href="xac_nhan_dat_ve.css">
	<link rel="stylesheet" href="../../layout/StyleHeader.css">
    <link rel="stylesheet" href="../../layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp"%>
	<div class="main">
		<div class="page-xac-nhan-dat-ve">
			<div class="title-xac-nhan-dat-ve">Đặt Vé Máy Bay</div>

			<div class="flight-info">
				<p><b>Hãng bay</b>: Việt Nam Airline</p>

				<p><b>Khởi hành tại:</b> Sân bay Tân Sơn Nhất
					<span>Thời gian: 12:00</span>
				</p>

				<p><b>Hạ cánh tại:</b> Sân bay Nội Bài
					<span>Thời gian: 18:00</span>
				</p>
				<p><b>Giá vé:</b> 1.200.000 đồng</p>
			</div>

			<div class="input-so-luong">
				<label>Số lượng</label>
				<div class="input">
					<input type="number" value="1" min="1">
				</div>
			</div>

			<div class="btn-xac-nhan-dat-ve">
				<a href="../../index.jsp">Xác Nhận Đặt Vé</a>
			</div>
		</div>
	</div>
<%@ include file="../../layout/Footer.jsp"%>

</body>
</html>