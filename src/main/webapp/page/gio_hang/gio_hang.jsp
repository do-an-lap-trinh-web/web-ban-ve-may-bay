<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><html>
<head>
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/gio_hang/gio_hang.css">
</head>
<body>
    <%@ include file="../../layout/Header.jsp"%>

    <div class="container">
        <div class="cart-header">
            <h1 class="cart-title">Giỏ Hàng (2 vé)</h1>
        </div>

        <div class="cart-layout">

            <div class="cart-items">

                <div class="ticket-card">
                    <div class="card-body">
                        <div class="ticket-info-row">
                            <span class="flight-code-simple">VJ101 - Phổ thông</span>
                            <a href="#" class="remove-btn">× Bỏ chọn</a>
                        </div>

                        <div class="route-simple">
                            <div class="time-box">
                                <span class="time-big">08:00</span>
                                <span class="date-small">Hà Nội (HAN)</span>
                            </div>
                            <div class="arrow-icon">➝</div>
                            <div class="time-box">
                                <span class="time-big">10:00</span>
                                <span class="date-small">TP.HCM (SGN)</span>
                            </div>
                            <div style="margin-left: auto; font-size: 12px; color: #888;">
                                15/10/2025
                            </div>
                        </div>

                        <div class="price-row">
                            <span class="airline-simple">Vietjet Air</span>
                            <span class="price-simple">1,200,000đ</span>
                        </div>
                    </div>
                </div>

                <div class="ticket-card">
                    <div class="card-body">
                        <div class="ticket-info-row">
                            <span class="flight-code-simple">VN204 - Thương gia</span>
                            <a href="#" class="remove-btn">× Bỏ chọn</a>
                        </div>

                        <div class="route-simple">
                            <div class="time-box">
                                <span class="time-big">16:30</span>
                                <span class="date-small">TP.HCM (SGN)</span>
                            </div>
                            <div class="arrow-icon">➝</div>
                            <div class="time-box">
                                <span class="time-big">18:40</span>
                                <span class="date-small">Hà Nội (HAN)</span>
                            </div>
                            <div style="margin-left: auto; font-size: 12px; color: #888;">
                                18/10/2025
                            </div>
                        </div>

                        <div class="price-row">
                            <span class="airline-simple">Vietnam Airlines</span>
                            <span class="price-simple">2,500,000đ</span>
                        </div>
                    </div>
                </div>

            </div>

            <div class="cart-summary">
                <div class="summary-box">
                    <div class="summary-title">Chi tiết thanh toán</div>

                    <div class="summary-row">
                        <span>Vé 1 (VJ101)</span>
                        <span>1,200,000đ</span>
                    </div>
                    <div class="summary-row">
                        <span>Vé 2 (VN204)</span>
                        <span>2,500,000đ</span>
                    </div>

                    <div class="total-row">
                        <span>Tổng tiền</span>
                        <span>3,700,000đ</span>
                    </div>

                    <button class="btn-checkout">Xác nhận đặt vé</button>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
