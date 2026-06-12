<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/gio_hang/gio_hang.css">
</head>
<body>
    <%@ include file="../../layout/Header.jsp"%>
    <%
        String messageThanhToan = (String) request.getAttribute("messageThanhToan");
        if (messageThanhToan != null) {
    %>
    <script>
        alert("<%= messageThanhToan %>")
    </script>
    <%
        }
    %>
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
                                           min="1"
                                           step="1"
                                           required
                                           data-quantity-input
                                           style="width: 50px; border: 1px solid #ccc; border-radius: 4px; padding: 2px 5px;"
                                    >
                                    <button type="submit">xác nhận</button>
                                </form>

                                <span class="price-simple" data-line-price data-unit-price="${item.veDto.gia}" style="font-weight: bold; color: #ff5722;">${item.veDto.gia}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

            <div class="cart-summary">
                <div class="summary-box">
                    <div class="summary-title">Chi tiết thanh toán</div>

                    <div class="total-row">
                        <span>Tổng tiền</span>
                        <span>${sessionScope.tongTien}</span>
                    </div>

                    <form action="${pageContext.request.contextPath}/ThanhToanGioHangController" method="post">
                        <button class="btn-checkout">Xác nhận đặt vé</button>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var quantityInputs = document.querySelectorAll('[data-quantity-input]');
            var totalElement = document.querySelector('.total-row span:last-child');

            function parseMoney(value) {
                return Number(String(value).replace(/[^\d]/g, '')) || 0;
            }

            function formatMoney(value) {
                return new Intl.NumberFormat('vi-VN').format(value) + ' đồng';
            }

            function updatePrices() {
                var total = 0;

                quantityInputs.forEach(function (input) {
                    var quantity = parseInt(input.value, 10);
                    if (isNaN(quantity) || quantity < 1) {
                        quantity = 1;
                        input.value = quantity;
                    }

                    var priceRow = input.closest('.price-row');
                    var priceElement = priceRow.querySelector('[data-line-price]');
                    var unitPrice = parseMoney(priceElement.dataset.unitPrice);
                    var lineTotal = unitPrice * quantity;

                    priceElement.textContent = formatMoney(lineTotal);
                    total += lineTotal;
                });

                if (totalElement) {
                    totalElement.textContent = formatMoney(total);
                }
            }

            quantityInputs.forEach(function (input) {
                input.addEventListener('input', updatePrices);
                input.addEventListener('blur', updatePrices);
                input.form.addEventListener('submit', updatePrices);
            });

            updatePrices();
        });
    </script>
</body>
</html>
