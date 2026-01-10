<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Danh sách vé đã đặt</title>
	<link rel="stylesheet" href="list_ve_da_dat.css">
	<link rel="stylesheet" href="../../layout/StyleHeader.css">
	<link rel="stylesheet" href="../../layout/StyleFooter.css">

</head>
<body>
<%@ include file="../../layout/Header.jsp" %>

<div class="list-ve">
	<h1>
		Danh sách vé máy bay
	</h1>
	<div style="" class="list-ve-item">
		<div class="flight-card">
			<div class="card-header">
        <span class="airline-name">
            <svg class="plane-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 16V14.5L14 10V3C14 2.45 13.55 2 13 2H11C10.45 2 10 2.45 10 3V10L3 14.5V16L10 13V20L8.5 22H9.5L12 21L14.5 22H15.5L14 20V13L21 16Z"
                      fill="currentColor"/>
            </svg>
            Vietnam Airlines
        </span>
				<div class="flight-times">
					<div class="time-detail departure">
						<span class="label">Cất cánh</span>
						<span class="">12:00</span>
					</div>
					<div class="time-detail arrival">
						<span class="label">Hạ cánh</span>
						<span class="">18:00</span>
					</div>
				</div>
			</div>

			<hr class="separator">

			<div class="card-body">
				<div class="airport departure">
					<span class="airport-code ">SGN</span>
					<span class="airport-name">Tân Sơn Nhất</span>
				</div>
				<div class="route-icon">
					<span class="arrow">→</span>
				</div>
				<div class="airport arrival">
					<span class="airport-code ">HAN</span>
					<span class="airport-name">Nội Bài</span>
				</div>
			</div>

			<div class="card-footer">
				<span class="quantity">Số lượng: 1</span>
				<span class="price">Giá: 1.200.000đ</span>
				<button onclick="OpenXacNhan()" class="cancel-button">Hủy vé</button>
			</div>

		</div>
		<div class="flight-card">
			<div class="card-header">
        <span class="airline-name">
            <svg class="plane-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 16V14.5L14 10V3C14 2.45 13.55 2 13 2H11C10.45 2 10 2.45 10 3V10L3 14.5V16L10 13V20L8.5 22H9.5L12 21L14.5 22H15.5L14 20V13L21 16Z"
                      fill="currentColor"/>
            </svg>
            Vietnam Airlines
        </span>
				<div class="flight-times">
					<div class="time-detail departure">
						<span class="label">Cất cánh</span>
						<span class="">12:00</span>
					</div>
					<div class="time-detail arrival">
						<span class="label">Hạ cánh</span>
						<span class="">18:00</span>
					</div>
				</div>
			</div>

			<hr class="separator">

			<div class="card-body">
				<div class="airport departure">
					<span class="airport-code ">SGN</span>
					<span class="airport-name">Tân Sơn Nhất</span>
				</div>
				<div class="route-icon">
					<span class="arrow">→</span>
				</div>
				<div class="airport arrival">
					<span class="airport-code ">HAN</span>
					<span class="airport-name">Nội Bài</span>
				</div>
			</div>

			<div class="card-footer">
				<span class="quantity">Số lượng: 1</span>
				<span class="price">Giá: 1.200.000đ</span>
				<button onclick="OpenXacNhan()" class="cancel-button">Hủy vé</button>
			</div>

		</div>
	</div>
	<div style="" class="list-ve-item">
		<div class="flight-card">
			<div class="card-header">
        <span class="airline-name">
            <svg class="plane-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 16V14.5L14 10V3C14 2.45 13.55 2 13 2H11C10.45 2 10 2.45 10 3V10L3 14.5V16L10 13V20L8.5 22H9.5L12 21L14.5 22H15.5L14 20V13L21 16Z"
                      fill="currentColor"/>
            </svg>
            Vietnam Airlines
        </span>
				<div class="flight-times">
					<div class="time-detail departure">
						<span class="label">Cất cánh</span>
						<span class="">12:00</span>
					</div>
					<div class="time-detail arrival">
						<span class="label">Hạ cánh</span>
						<span class="">18:00</span>
					</div>
				</div>
			</div>

			<hr class="separator">

			<div class="card-body">
				<div class="airport departure">
					<span class="airport-code ">SGN</span>
					<span class="airport-name">Tân Sơn Nhất</span>
				</div>
				<div class="route-icon">
					<span class="arrow">→</span>
				</div>
				<div class="airport arrival">
					<span class="airport-code ">HAN</span>
					<span class="airport-name">Nội Bài</span>
				</div>
			</div>

			<div class="card-footer">
				<span class="quantity">Số lượng: 1</span>
				<span class="price">Giá: 1.200.000đ</span>
				<button onclick="OpenXacNhan()" class="cancel-button">Hủy vé</button>
			</div>

		</div>
		<div class="flight-card">
			<div class="card-header">
        <span class="airline-name">
            <svg class="plane-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 16V14.5L14 10V3C14 2.45 13.55 2 13 2H11C10.45 2 10 2.45 10 3V10L3 14.5V16L10 13V20L8.5 22H9.5L12 21L14.5 22H15.5L14 20V13L21 16Z"
                      fill="currentColor"/>
            </svg>
            Vietnam Airlines
        </span>
				<div class="flight-times">
					<div class="time-detail departure">
						<span class="label">Cất cánh</span>
						<span class="">12:00</span>
					</div>
					<div class="time-detail arrival">
						<span class="label">Hạ cánh</span>
						<span class="">18:00</span>
					</div>
				</div>
			</div>

			<hr class="separator">

			<div class="card-body">
				<div class="airport departure">
					<span class="airport-code ">SGN</span>
					<span class="airport-name">Tân Sơn Nhất</span>
				</div>
				<div class="route-icon">
					<span class="arrow">→</span>
				</div>
				<div class="airport arrival">
					<span class="airport-code ">HAN</span>
					<span class="airport-name">Nội Bài</span>
				</div>
			</div>

			<div class="card-footer">
				<span class="quantity">Số lượng: 1</span>
				<span class="price">Giá: 1.200.000đ</span>
				<button onclick="OpenXacNhan()" class="cancel-button">Hủy vé</button>
			</div>

		</div>
	</div>
</div>
<div id="box-xac-nhan" class="content-xac-nhan">
	<div class="card-xac-nhan">
		<span class="card-xac-nhan-title"><center>BẠN CÓ MUỐN HUỶ</center></span>
		<button onclick="CloseXacNhan()" class="btn-xac-nhan-exit">X</button>
		<div class="flight-card">
			<div class="card-header">
        <span class="airline-name">
            <svg class="plane-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 16V14.5L14 10V3C14 2.45 13.55 2 13 2H11C10.45 2 10 2.45 10 3V10L3 14.5V16L10 13V20L8.5 22H9.5L12 21L14.5 22H15.5L14 20V13L21 16Z"
                      fill="currentColor"/>
            </svg>
            Vietnam Airlines
        </span>
				<div class="flight-times">
					<div class="time-detail departure">
						<span class="label">Cất cánh</span>
						<span class="">12:00</span>
					</div>
					<div class="time-detail arrival">
						<span class="label">Hạ cánh</span>
						<span class="">18:00</span>
					</div>
				</div>
			</div>

			<hr class="separator">

			<div class="card-body">
				<div class="airport departure">
					<span class="airport-code ">SGN</span>
					<span class="airport-name">Tân Sơn Nhất</span>
				</div>
				<div class="route-icon">
					<span class="arrow">→</span>
				</div>
				<div class="airport arrival">
					<span class="airport-code ">HAN</span>
					<span class="airport-name">Nội Bài</span>
				</div>
			</div>

			<div class="card-footer">
				<span class="quantity">Số lượng: 1</span> <br>
				<span class="price">Giá: 1.200.000đ</span>
			</div>
			<div class="button-xac-nhan">
				<button onclick="HuyThanhCong()" class="cancel-button">Xác nhận huỷ vé</button>
			</div>

		</div>
	</div>
</div>

<%@ include file="../../layout/Footer.jsp" %>

<script src="list_ve_da_dat.js"></script>
</body>
</html>