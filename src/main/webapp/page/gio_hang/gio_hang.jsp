<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/gio_hang/gio_hang.css">
    <style>
        .voucher-option {
            display: flex !important;
            align-items: center !important;
            background: #ffffff !important;
            border: 2px solid #e2e8f0 !important;
            border-radius: 10px !important;
            cursor: pointer !important;
            gap: 12px !important;
            margin-bottom: 10px !important;
            padding: 12px !important;
            transition: all 0.2s ease-in-out !important;
            width: 100% !important;
            box-sizing: border-box !important;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02) !important;
        }
        .voucher-option:hover {
            border-color: #0056b3 !important;
            background-color: #f8faff !important;
            box-shadow: 0 2px 8px rgba(0, 86, 179, 0.1) !important;
        }
        .voucher-option.is-selected {
            border-color: #28a745 !important;
            background-color: #f4fbf7 !important;
            box-shadow: 0 2px 8px rgba(40, 167, 69, 0.1) !important;
        }
        .voucher-option.is-disabled {
            background: #f6f8fb !important;
            border-color: #e2e8f0 !important;
            opacity: 0.58 !important;
            cursor: not-allowed !important;
            box-shadow: none !important;
        }
        .voucher-option input[type="radio"] {
            display: block !important;
            margin: 0 !important;
            width: 18px !important;
            height: 18px !important;
            accent-color: #28a745 !important;
            cursor: pointer !important;
        }
        .voucher-option span {
            display: flex !important;
            flex-direction: column !important;
            float: none !important;
            text-align: left !important;
        }
        .voucher-option strong {
            display: block !important;
            color: #222 !important;
            font-size: 14px !important;
            font-weight: bold !important;
        }
        .voucher-option small {
            display: block !important;
            color: #666 !important;
            font-size: 12px !important;
            margin-top: 2px !important;
        }
    </style>
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
                <c:choose>
                    <c:when test="${empty sessionScope.gioHang}">
                        <div class="ticket-card empty-cart">
                            <div class="card-body">Giỏ hàng của bạn đang trống.</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${sessionScope.gioHang}" var="item">
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

                                    <div class="price-row">
                                        <span class="airline-simple">${item.veDto.hangBay}</span>

                                        <form action="${pageContext.request.contextPath}/GioHangController" method="post" class="quantity-form">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="idVe" value="${item.veDto.idVe}">
                                            <label>SL:</label>
                                            <input type="number" name="soLuong"
                                                   value="${item.soLuong}"
                                                   min="1"
                                                   step="1"
                                                   required
                                                   data-quantity-input
                                                   data-ticket-id="${item.veDto.idVe}">
                                            <button type="submit">Cập nhật</button>
                                        </form>

                                        <span class="price-simple" data-line-price data-unit-price="${item.veDto.gia}" data-airline="${item.veDto.hangBay}">${item.veDto.gia}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="cart-summary">
                <div class="summary-box">
                    <div class="summary-title">Chi tiết thanh toán</div>

                    <form action="${pageContext.request.contextPath}/ThanhToanGioHangController" method="post" data-checkout-form>
                        <div class="voucher-section">
                            <div class="section-heading">
                                <span>Voucher</span>
                                <span data-selected-voucher>Chưa chọn</span>
                            </div>

                            <label class="voucher-option is-empty">
                                <input type="radio" name="voucherCode" value="" data-voucher-radio data-type="none" checked>
                                <span>
                                    <strong>Không dùng voucher</strong>
                                    <small>Giữ nguyên giá vé</small>
                                </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="FLIGHT50K" data-voucher-radio data-type="fixed" data-value="50000" data-max="50000" data-min="1500000">
                                <span>
                                    <strong>Giảm 50.000đ</strong>
                                    <small>Đơn từ 1.500.000đ</small>
                                </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="BAY100K" data-voucher-radio data-type="fixed" data-value="100000" data-max="100000" data-min="3000000">
                                <span>
                                    <strong>Giảm 100.000đ</strong>
                                    <small>Đơn từ 3.000.000đ</small>
                                </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="WEEKEND5" data-voucher-radio data-type="percent" data-value="5" data-max="150000" data-min="2000000">
                                <span>
                                    <strong>Giảm 5%</strong>
                                    <small>Tối đa 150.000đ, đơn từ 2.000.000đ</small>
                                </span>
                            </label>

                            <label class="voucher-option">
                                <input type="radio" name="voucherCode" value="VNA200K" data-voucher-radio data-type="fixed" data-value="200000" data-max="200000" data-min="5000000" data-airline="Vietnam Airlines">
                                <span>
                                    <strong>Vietnam Airlines -200.000đ</strong>
                                    <small>Đơn từ 5.000.000đ, chỉ áp dụng vé Vietnam Airlines</small>
                                </span>
                            </label>
                        </div>

                        <div class="reward-section">
                            <div class="section-heading">
                                <span>Điểm thưởng</span>
                                <span><span data-available-points>${empty sessionScope.diemThuong ? 0 : sessionScope.diemThuong}</span> điểm</span>
                            </div>
                            <div class="reward-control">
                                <input type="range" name="diemDoi" min="0" value="0" step="1" data-reward-range>
                                <input type="number" min="0" value="0" step="1" data-reward-number>
                            </div>
                            <div class="reward-note">1 điểm = 1.000 đồng, dùng tối đa 10% giá trị đơn sau voucher để tránh giảm quá sâu.</div>
                        </div>

                        <div class="summary-row">
                            <span>Tạm tính</span>
                            <span data-subtotal>${sessionScope.tongTien}</span>
                        </div>
                        <div class="summary-row discount-row">
                            <span>Voucher giảm</span>
                            <span data-voucher-discount>-0</span>
                        </div>
                        <div class="summary-row discount-row">
                            <span>Đổi điểm</span>
                            <span data-reward-discount>-0</span>
                        </div>
                        <div class="summary-row">
                            <span>Dự kiến nhận</span>
                            <span><span data-earned-points>0</span> điểm</span>
                        </div>

                        <div class="total-row">
                            <span>Tổng thanh toán</span>
                            <span data-cart-total>${sessionScope.tongTien}</span>
                        </div>

                        <button class="btn-checkout" <c:if test="${empty sessionScope.gioHang}">disabled</c:if>>Xác nhận đặt vé</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var quantityInputs = document.querySelectorAll('[data-quantity-input]');
            var voucherRadios = document.querySelectorAll('[data-voucher-radio]');
            var selectedVoucherElement = document.querySelector('[data-selected-voucher]');
            var subtotalElement = document.querySelector('[data-subtotal]');
            var voucherDiscountElement = document.querySelector('[data-voucher-discount]');
            var rewardDiscountElement = document.querySelector('[data-reward-discount]');
            var totalElement = document.querySelector('[data-cart-total]');
            var earnedPointsElement = document.querySelector('[data-earned-points]');
            var rewardRange = document.querySelector('[data-reward-range]');
            var rewardNumber = document.querySelector('[data-reward-number]');
            var availablePointsElement = document.querySelector('[data-available-points]');

            function parseMoney(value) {
                return Number(String(value).replace(/[^\d]/g, '')) || 0;
            }

            function formatMoney(value) {
                return new Intl.NumberFormat('vi-VN').format(Math.max(Math.floor(value), 0)) + ' đồng';
            }

            function getAvailablePoints() {
                return parseInt(String(availablePointsElement ? availablePointsElement.textContent : '0').replace(/[^\d]/g, ''), 10) || 0;
            }

            function getSelectedVoucher() {
                for (var i = 0; i < voucherRadios.length; i++) {
                    if (voucherRadios[i].checked) {
                        return voucherRadios[i];
                    }
                }
                return null;
            }

            function getEligibleSubtotal(voucherRadio) {
                var airline = voucherRadio.dataset.airline || '';
                var subtotal = 0;

                quantityInputs.forEach(function (input) {
                    var quantity = parseInt(input.value, 10);
                    var priceRow = input.closest('.price-row');
                    var priceElement = priceRow.querySelector('[data-line-price]');
                    var itemAirline = priceElement.dataset.airline || '';

                    if (!airline || itemAirline.indexOf(airline) !== -1) {
                        subtotal += parseMoney(priceElement.dataset.unitPrice) * (isNaN(quantity) || quantity < 1 ? 1 : quantity);
                    }
                });

                return subtotal;
            }

            function updateVoucherAvailability(subtotal) {
                var emptyVoucher = null;

                voucherRadios.forEach(function (radio) {
                    var option = radio.closest('.voucher-option');
                    if (radio.dataset.type === 'none') {
                        emptyVoucher = radio;
                        return;
                    }

                    var minOrder = parseMoney(radio.dataset.min);
                    var eligibleSubtotal = getEligibleSubtotal(radio);
                    var isAvailable = subtotal >= minOrder && eligibleSubtotal > 0;

                    radio.disabled = !isAvailable;
                    if (option) {
                        option.classList.toggle('is-disabled', !isAvailable);
                    }

                    if (!isAvailable && radio.checked && emptyVoucher) {
                        emptyVoucher.checked = true;
                    }
                });
            }

            function updateSelectedVoucherClass() {
                voucherRadios.forEach(function (radio) {
                    var option = radio.closest('.voucher-option');
                    if (option) {
                        option.classList.toggle('is-selected', radio.checked);
                    }
                });
            }

            function calculateVoucherDiscount(voucherRadio, subtotal) {
                if (!voucherRadio || voucherRadio.dataset.type === 'none') {
                    return 0;
                }

                var minOrder = parseMoney(voucherRadio.dataset.min);
                var eligibleSubtotal = getEligibleSubtotal(voucherRadio);
                if (subtotal < minOrder || eligibleSubtotal <= 0) {
                    return 0;
                }

                var discount = 0;
                var value = parseMoney(voucherRadio.dataset.value);
                var maxDiscount = parseMoney(voucherRadio.dataset.max);

                if (voucherRadio.dataset.type === 'percent') {
                    discount = eligibleSubtotal * value / 100;
                } else {
                    discount = value;
                }

                return Math.min(Math.floor(discount), maxDiscount, eligibleSubtotal);
            }

            function syncRewardValue(value, maxPoints) {
                var rewardValue = parseInt(value, 10);
                if (isNaN(rewardValue) || rewardValue < 0) {
                    rewardValue = 0;
                }
                rewardValue = Math.min(rewardValue, maxPoints);

                if (rewardRange) {
                    rewardRange.max = maxPoints;
                    rewardRange.value = rewardValue;
                }
                if (rewardNumber) {
                    rewardNumber.max = maxPoints;
                    rewardNumber.value = rewardValue;
                }

                return rewardValue;
            }

            function updatePrices() {
                var subtotal = 0;

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
                    subtotal += lineTotal;
                });

                updateVoucherAvailability(subtotal);
                var selectedVoucher = getSelectedVoucher();
                var voucherDiscount = calculateVoucherDiscount(selectedVoucher, subtotal);
                var totalAfterVoucher = subtotal - voucherDiscount;
                var maxRewardByOrder = Math.floor((totalAfterVoucher * 0.1) / 1000);
                var maxRewardPoints = Math.min(getAvailablePoints(), maxRewardByOrder);
                var rewardPoints = syncRewardValue(rewardRange ? rewardRange.value : 0, maxRewardPoints);
                var rewardDiscount = rewardPoints * 1000;
                var grandTotal = totalAfterVoucher - rewardDiscount;

                if (selectedVoucherElement) {
                    selectedVoucherElement.textContent = selectedVoucher && selectedVoucher.value ? selectedVoucher.value : 'Chưa chọn';
                }
                if (subtotalElement) {
                    subtotalElement.textContent = formatMoney(subtotal);
                }
                if (voucherDiscountElement) {
                    voucherDiscountElement.textContent = '-' + formatMoney(voucherDiscount);
                }
                if (rewardDiscountElement) {
                    rewardDiscountElement.textContent = '-' + formatMoney(rewardDiscount);
                }
                if (totalElement) {
                    totalElement.textContent = formatMoney(grandTotal);
                }
                if (earnedPointsElement) {
                    earnedPointsElement.textContent = Math.floor(grandTotal / 100000);
                }
                updateSelectedVoucherClass();
            }

            function syncCheckoutQuantities() {
                var checkoutForm = document.querySelector('[data-checkout-form]');
                if (!checkoutForm) {
                    return;
                }

                checkoutForm.querySelectorAll('[data-sync-field]').forEach(function (field) {
                    field.remove();
                });

                quantityInputs.forEach(function (input) {
                    var quantity = parseInt(input.value, 10);
                    if (isNaN(quantity) || quantity < 1) {
                        quantity = 1;
                        input.value = quantity;
                    }

                    var idInput = document.createElement('input');
                    idInput.type = 'hidden';
                    idInput.name = 'idVe';
                    idInput.value = input.dataset.ticketId;
                    idInput.setAttribute('data-sync-field', 'true');

                    var quantityInput = document.createElement('input');
                    quantityInput.type = 'hidden';
                    quantityInput.name = 'soLuong';
                    quantityInput.value = quantity;
                    quantityInput.setAttribute('data-sync-field', 'true');

                    checkoutForm.appendChild(idInput);
                    checkoutForm.appendChild(quantityInput);
                });
            }

            quantityInputs.forEach(function (input) {
                input.addEventListener('input', updatePrices);
                input.addEventListener('blur', updatePrices);
                input.form.addEventListener('submit', updatePrices);
            });

            voucherRadios.forEach(function (radio) {
                radio.addEventListener('change', updatePrices);
            });

            if (rewardRange) {
                rewardRange.addEventListener('input', function () {
                    if (rewardNumber) {
                        rewardNumber.value = rewardRange.value;
                    }
                    updatePrices();
                });
            }

            if (rewardNumber) {
                rewardNumber.addEventListener('input', function () {
                    if (rewardRange) {
                        rewardRange.value = rewardNumber.value;
                    }
                    updatePrices();
                });
            }

            var checkoutForm = document.querySelector('[data-checkout-form]');
            if (checkoutForm) {
                checkoutForm.addEventListener('submit', function () {
                    updatePrices();
                    syncCheckoutQuantities();
                });
            }

            updatePrices();
        });
    </script>
</body>
</html>
