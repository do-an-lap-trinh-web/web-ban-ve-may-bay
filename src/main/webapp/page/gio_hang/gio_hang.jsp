<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/gio_hang/gio_hang.css">
</head>
<body>
    <%@ include file="../../layout/Header.jsp"%>

    <div class="container">

        <div class="cart-layout">
            <div class="cart-items">
                <c:forEach items="${sessionScope.gioHang}" var="item">
<%--                    <div class="ticket-card">--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="ticket-info-row">--%>
<%--                                <span class="flight-code-simple">${item.veDto.soHieuChuyenBay} - ${item.veDto.hangGhe} - số lương: ${item.soLuong}</span>--%>
<%--                                <a href="#" class="remove-btn">× Bỏ chọn</a>--%>
<%--                            </div>--%>

<%--                            <div class="route-simple">--%>
<%--                                <div class="time-box">--%>
<%--                                    <span class="time-big">${item.veDto.thoiGianKhoiHanh}</span>--%>
<%--                                    <span class="date-small">${item.veDto.diemDi}</span>--%>
<%--                                </div>--%>
<%--                                <div class="arrow-icon">➝</div>--%>
<%--                                <div class="time-box">--%>
<%--                                    <span class="time-big">${item.veDto.thoiGianHaCanh}</span>--%>
<%--                                    <span class="date-small">${item.veDto.diemDen}</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="price-row">--%>
<%--                                <span class="airline-simple">${item.veDto.hangBay}</span>--%>
<%--                                <span class="price-simple">${item.veDto.gia}</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="ticket-card">
                        <div class="card-body">
                            <div class="ticket-info-row">
                                <span class="flight-code-simple">${item.veDto.soHieuChuyenBay} - ${item.veDto.hangGhe}</span>
                                <a href="${pageContext.request.contextPath}/GioHangController?action=remove&ve=${item.veDto.idVe}" class="remove-btn">× Bỏ chọn</a>
                            </div>

                            <div class="route-simple">
                                <div class="time-box">
                                    <span class="time-big">${item.veDto.thoiGianKhoiHanh}</span>
                                    <span class="date-small">${item.veDto.diemDi}</span>
                                </div>
                                <div class="arrow-icon">➝</div>
                                <div class="time-box">
                                    <span class="time-big">${item.veDto.thoiGianHaCanh}</span>
                                    <span class="date-small">${item.veDto.diemDen}</span>
                                </div>
                            </div>

                            <div class="price-row" style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                                <span class="airline-simple">${item.veDto.hangBay}</span>

                                <form action="${pageContext.request.contextPath}/GioHangController" method="post" class="quantity-form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="idVe" value="${item.veDto.idVe}">
                                    <label style="font-size: 0.8rem;">SL:</label>
                                    <input type="number" name="soLuong"
                                           value="${item.soLuong}"
                                           style="width: 50px; border: 1px solid #ccc; border-radius: 4px; padding: 2px 5px;"
                                    >
                                    <button type="submit">xác nhận</button>
                                </form>

                                <span class="price-simple" style="font-weight: bold; color: #ff5722;">${item.veDto.gia}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

            <div class="cart-summary">
                <div class="summary-box">
                    <div class="summary-title">Chi tiết thanh toán</div>

<%--                    <div class="summary-row">--%>
<%--                        <span>Vé 1 (VJ101)</span>--%>
<%--                        <span>1,200,000đ</span>--%>
<%--                    </div>--%>
<%--                    <div class="summary-row">--%>
<%--                        <span>Vé 2 (VN204)</span>--%>
<%--                        <span>2,500,000đ</span>--%>
<%--                    </div>--%>

                    <div class="total-row">
                        <span>Tổng tiền</span>
                        <span>${sessionScope.tongTien}</span>
                    </div>

                    <button class="btn-checkout">Xác nhận đặt vé</button>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
