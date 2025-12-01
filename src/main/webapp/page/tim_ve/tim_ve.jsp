
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Tìm vé</title>
	<link rel="stylesheet" href="tim_ve.css">
	<link rel="stylesheet" href="../../layout/StyleHeader.css">
	<link rel="stylesheet" href="../../layout/StyleFooter.css">
</head>
<body>
<!--start header-->
<%@include file="../../layout/Header.jsp"%>
<!--end header-->

<div class="container">
	<div class="img-mau-bay">
		<img class="img-mau-bay-item" src="../../access/trang_chu/trang_tim_ve/anh_may_bay.png" alt="">
	</div>
</div>
<div class="container">
	<form action="" class="form-tim-ve">
		<div class="form-quoc-gia">
			<div>
				<label>Khởi hành tại: </label>
				<select name="diem_di" class="select select-diem-di">
					<option>
						Việt Nam
					</option>
					<option>
						Thái Lan
					</option>
					<option>
						Anh
					</option>
					<option>
						Mĩ
					</option>
					<option>
						Úc
					</option>

				</select>
			</div>
			<div class="khoang-cach-form"></div>
			<div>
				<label>Hạ cánh tại: </label>
				<select name="diem_di" class="select select-diem-di">
					<option>
						Việt Nam
					</option>
					<option>
						Thái Lan
					</option>
					<option>
						Anh
					</option>
					<option>
						Mĩ
					</option>
					<option>
						Úc
					</option>
				</select>
			</div>
			<div class="khoang-cach-form"></div>
			<div>
				<label>Hạng ghế: </label>
				<select name="diem_di" class="select select-diem-di">
					<option>
						Thương gia
					</option>
					<option>
						Phổ thông
					</option>
					<option>
						Giá rẻ
					</option>

				</select>
			</div>
		</div>
		<div class="form-tim-ve-item">
			<div class="form-select">
				<div>
					<label>Điểm đi: </label>
					<select name="diem_di" class="select select-diem-di">
						<option>
							Hồ Chí Minh
						</option>
						<option>
							Hà Nội
						</option>
						<option>
							Hải Phòng
						</option>
						<option>
							Gia Lai
						</option>
						<option>
							An Giang
						</option>
						<option>
							Nghệ An
						</option>
						<option>
							Lâm Đồng
						</option>
						<option>
							Điện Biên
						</option>
						<option>
							Thanh Hoá
						</option>
						<option>
							Quảng Ninh
						</option>
						<option>
							Khánh Hoà
						</option>
						<option>
							Sơn La
						</option>
						<option>
							Hà Nội
						</option>
						<option>
							Đà Nẵng
						</option>
						<option>
							Cần Thơ
						</option>
						<option>
							Quảng Trị
						</option>
						<option>
							Đăk Lăk
						</option>
						<option>
							Khánh Hoà
						</option>
					</select>
				</div>


				<div class="khoang-cach-form"></div>

				<div>
					<label>Điểm đến: </label>
					<select name="diem_den" class="select select-diem-den">
						<option>
							Hồ Chí Minh
						</option>
						<option>
							Hà Nội
						</option>
						<option>
							Hải Phòng
						</option>
						<option>
							Gia Lai
						</option>
						<option>
							An Giang
						</option>
						<option>
							Nghệ An
						</option>
						<option>
							Lâm Đồng
						</option>
						<option>
							Điện Biên
						</option>
						<option>
							Thanh Hoá
						</option>
						<option>
							Quảng Ninh
						</option>
						<option>
							Khánh Hoà
						</option>
						<option>
							Sơn La
						</option>
						<option>
							Hà Nội
						</option>
						<option>
							Đà Nẵng
						</option>
						<option>
							Cần Thơ
						</option>
						<option>
							Quảng Trị
						</option>
						<option>
							Đăk Lăk
						</option>
						<option>
							Khánh Hoà
						</option>
					</select>
				</div>

				<div class="khoang-cach-form"></div>

				<div>
					<input class="cb cb-gia-ve" type="checkbox" name="is_xep_ve" id="">
					<label>Chọn vé giá thấp nhất</label>
				</div>
			</div>
			<div>
				<label>Ngày khơi hành: </label>
				<input class="input-ngay-khoi-hanh" type="date" name="ngay_di" id="">
			</div>
		</div>

		<div class="form-tim-ve-item form-tim-ve-item-btn">
			<button type="submit" class="btn-tim-ve">
				<a href="../list_ve/list_ve.jsp">Tìm vé</a>
			</button>
		</div>

	</form>
</div>
<%@include file="../../layout/Footer.jsp"%>
</body>
</html>