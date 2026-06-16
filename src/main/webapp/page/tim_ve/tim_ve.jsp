<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<title>Tìm vé máy bay</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/page/tim_ve/tim_ve.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp"%>

<div class="banner-container">
	<div class="img-mau-bay">
		<img class="img-mau-bay-item" src="${pageContext.request.contextPath}/access/trang_chu/trang_tim_ve/anh_may_bay.png" alt="Máy bay online">
	</div>
</div>

<div class="search-container">
	<form action="${pageContext.request.contextPath}/TimVeController" class="flight-search-form">

		<div class="trip-type-selector">
			<label class="radio-label">
				<input type="radio" name="loai_hinh" value="one_way" checked onclick="toggleReturnDate(false)"> Một chiều
			</label>
			<label class="radio-label">
				<input type="radio" name="loai_hinh" value="round_trip" onclick="toggleReturnDate(true)"> Khứ hồi
			</label>
		</div>

		<div class="form-row top-row">
			<div class="input-group">
				<label>Khởi hành tại</label>
				<select id="khoiHanh" onchange="updateSearch()" name="khoi_hanh" class="search-select" required>
					<option>${param.get("khoiHanh")}</option>
					<c:forEach var="quocGia" items="${thongTinTimVeDto.listKhoiHanh}">
						<option>${quocGia}</option>
					</c:forEach>
				</select>
			</div>

			<div class="input-group">
				<label>Hạ cánh tại</label>
				<select id="haCanh" onchange="updateSearch()" name="ha_canh" class="search-select" required>
					<option>${param.get("haCanh")}</option>
					<c:forEach var="quocGia" items="${thongTinTimVeDto.listHaCanh}">
						<option>${quocGia}</option>
					</c:forEach>
				</select>
			</div>

			<div class="input-group">
				<label>Hạng ghế</label>
				<select name="hang_ghe" class="search-select" required>
					<c:forEach var="hangGhe" items="${thongTinTimVeDto.listHangGhe}">
						<option>${hangGhe}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<hr class="form-divider">

		<div class="form-row bottom-row">
			<div class="input-group">
				<label>Điểm đi</label>
				<select name="diem_di" class="search-select" required>
					<c:forEach var="diemDi" items="${thongTinTimVeDto.listDiemDi}">
						<option <c:if test="${diemDi == param.diemDi}">selected</c:if>>${diemDi}</option>
					</c:forEach>
				</select>
			</div>

			<div class="input-group">
				<label>Điểm đến</label>
				<select name="diem_den" class="search-select" required>
					<c:forEach var="diemDen" items="${thongTinTimVeDto.listDiemDen}">
						<option <c:if test="${diemDen == param.diemDen}">selected</c:if>>${diemDen}</option>
					</c:forEach>
				</select>
			</div>

			<div class="input-group">
				<label>Ngày đi</label>
				<input type="date" name="ngay_di" id="ngay_di" min="${requestScope.today}" class="search-input" required>
			</div>

			<div class="input-group" id="return-date-container" style="display: none;">
				<label>Ngày về</label>
				<input type="date" name="ngay_ve" id="ngay_ve" min="${requestScope.today}" class="search-input">
				<div class="flexible-date">
					<input type="checkbox" name="ngay_ve_linh_hoat" id="ngay_ve_linh_hoat">
					<label for="ngay_ve_linh_hoat">Linh hoạt (±3 ngày)</label>
				</div>
			</div>
		</div>

		<div class="form-footer">
			<div class="extra-options">
				<input type="checkbox" name="is_xep_ve" id="giaThapNhat">
				<label for="giaThapNhat">Tìm vé giá rẻ nhất</label>
			</div>
			<button type="submit" class="btn-search-flight">TÌM CHUYẾN BAY</button>
		</div>

	</form>
</div>

<%@include file="../../layout/Footer.jsp"%>

<script>
	function updateSearch() {
		var khoiHanh = document.getElementById('khoiHanh').value;
		var haCanh = document.getElementById('haCanh').value;
		var baseUrl = "${pageContext.request.contextPath}/ThongTinTimVeController";
		var url = baseUrl + "?khoiHanh=" + encodeURIComponent(khoiHanh) + "&haCanh=" + encodeURIComponent(haCanh);
		window.location.href = url;
	}

	function toggleReturnDate(show) {
		var returnContainer = document.getElementById('return-date-container');
		var ngayDiInput = document.getElementById('ngay_di');
		var ngayVeInput = document.getElementById('ngay_ve');
		if (show) {
			returnContainer.style.display = 'flex'; // Dùng flex để canh layout
			ngayVeInput.setAttribute('required', 'required');
			ngayVeInput.min = ngayDiInput.value || ngayDiInput.min;
		} else {
			returnContainer.style.display = 'none';
			ngayVeInput.removeAttribute('required');
			ngayVeInput.value = '';
		}
	}

	document.addEventListener('DOMContentLoaded', function () {
		var today = new Date().toISOString().split('T')[0];
		var ngayDiInput = document.getElementById('ngay_di');
		var ngayVeInput = document.getElementById('ngay_ve');

		ngayDiInput.min = ngayDiInput.min || today;
		ngayVeInput.min = ngayVeInput.min || today;

		ngayDiInput.addEventListener('change', function () {
			ngayVeInput.min = ngayDiInput.value || ngayDiInput.min;
			if (ngayVeInput.value && ngayVeInput.value < ngayVeInput.min) {
				ngayVeInput.value = '';
			}
		});
	});
</script>
</body>
</html>