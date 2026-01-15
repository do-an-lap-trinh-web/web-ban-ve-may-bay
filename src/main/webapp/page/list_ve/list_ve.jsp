<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>danh sách vé</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/list_ve/list_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp" %>
<div class="container flex">


	<div class="list-ve">
		<h1>
			Danh sách vé máy bay
		</h1>


<%--        <c:forEach items="${listVeRes}" var="item">--%>
<%--            <div class="list-ve-item">--%>
<%--                <div class="info">--%>
<%--                    <img src="../../access/trang_chu/Logo.png" alt="">--%>
<%--                    <div class="info-ve">--%>
<%--                        <div class="info-hang-bay">--%>
<%--                            <span class="text-hang-bay">Hãng bay: ${item.hangBay}</span>--%>
<%--                        </div>--%>
<%--                        <div class="info-dia-diem">--%>
<%--                            <div>--%>
<%--                                <span class="text-hang-bay">Khởi Hành: ${item.khoiHanh}</span>--%>
<%--                            </div>--%>
<%--                            <div style="margin: 0px 20px 0px 20px">======></div>--%>
<%--                            <div>--%>
<%--                                <span class="text-hang-bay"> Hạ Cánh: ${item.haCanh}</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="info-thoi-gian">--%>
<%--                        <div>--%>
<%--                            <span class="cat-canh">Cất cánh: ${item.thoiGianKhoiHanh}</span>--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <span class="ha-canh"> Hạ Cánh: ${item.thoiGianHaCanh}</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="btn-dat-ve">--%>
<%--                    <button type="submit">--%>
<%--                        <a href="../xac_nhan_dat_ve/xac_nhan_dat_ve.jsp">Chọn</a>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>

        <c:choose>
            <%-- Trường hợp 1: Nếu danh sách không rỗng --%>
            <c:when test="${not empty listVeRes}">
                <c:forEach items="${listVeRes}" var="item">
                    <div class="list-ve-item">
                        <div class="info">
                            <img src="../../access/trang_chu/Logo.png" alt="">
                            <div class="info-ve">
                                <div class="info-hang-bay">
                                    <span class="text-hang-bay">Hãng bay: ${item.hangBay}</span>
                                </div>
                                <div class="info-dia-diem">
                                    <div>
                                        <span class="text-hang-bay">Khởi Hành: ${item.khoiHanh}</span>
                                    </div>
                                    <div style="margin: 0px 20px 0px 20px">======></div>
                                    <div>
                                        <span class="text-hang-bay"> Hạ Cánh: ${item.haCanh}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="info-thoi-gian">
                                <div>
                                    <span class="cat-canh">Cất cánh: ${item.thoiGianKhoiHanh}</span>
                                </div>
                                <div>
                                    <span class="ha-canh"> Hạ Cánh: ${item.thoiGianHaCanh}</span>
                                </div>
                            </div>
                        </div>

                        <div class="btn-dat-ve">
                            <button type="submit">
                                <a href="../xac_nhan_dat_ve/xac_nhan_dat_ve.jsp">Chọn</a>
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <%-- Trường hợp 2: Nếu danh sách rỗng (null hoặc size = 0) --%>
            <c:otherwise>
                <div class="no-tickets" style="text-align: center; padding: 50px; font-size: 1.2rem; color: #666;">
                    <img src="../../access/trang_chu/no-data-icon.png" alt="" style="width: 100px; margin-bottom: 20px;">
                    <p>Rất tiếc, hiện tại không có vé nào phù hợp với yêu cầu của bạn.</p>
                    <p>Vui lòng thử lại với thời gian hoặc địa điểm khác.</p>
                </div>
            </c:otherwise>
        </c:choose>


	</div>

	<div class="box-form">
		<form action="" class="form-tim-ve">
			<div class="form-tim-ve-item">
				<div class="form-title">
					<h1>Tìm vé</h1>
				</div>
				<div class="form-select">
					<div class="flex">
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

						<div>
							<label>Khởi hành tại: </label>
							<select name="diem_den" class="select select-diem-den">
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
					</div>


					<div class="khoang-cach-form"></div>

					<div class="flex">
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

						<div>
							<label>Hạ cánh tại: </label>
							<select name="diem_den" class="select select-diem-den">
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
					</div>
					<div class="flex form-chon-hang-ghe">
						<div>
							<label>Hạng ghế: </label>
							<select name="diem_den" class="select select-diem-den">
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

					<div class="khoang-cach-form"></div>


					<div class="khoang-cach-form"></div>

					<div>
						<input class="cb cb-gia-ve" type="checkbox" name="is_xep_ve" id="">
						<label>Chọn vé giá thấp nhất</label>
					</div>
				</div>
				<div class="form-input-ngay-khoi-hanh">
					<label>Ngày khơi hành: </label>
					<input class="input-ngay-khoi-hanh" type="date" name="ngay_di" id="">
				</div>
			</div>

			<div class="form-tim-ve-item form-tim-ve-item-btn">
				<button type="submit" class="btn-tim-ve">
					<a href="">Tìm vé</a>
				</button>
			</div>

		</form>
	</div>


</div>

<%@include file="../../layout/Footer.jsp"%>

</body>
</html>