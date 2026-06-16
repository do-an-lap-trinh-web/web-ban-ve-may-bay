<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách vé máy bay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/list_ve/list_ve.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp" %>

<div class="container" style="margin-top: 20px;">
    <c:if test="${not empty message}">
        <div style="background-color: #fff1f0; padding: 15px; border-radius: 8px; margin-bottom: 20px; border-left: 5px solid #ff4d4f; color: #a8071a;">
                ${message}
        </div>
    </c:if>
    <c:if test="${isRoundTrip}">
        <div style="background-color: #e6f7ff; padding: 15px; border-radius: 8px; margin-bottom: 20px; border-left: 5px solid #1890ff;">
            <h3 style="margin: 0; color: #0050b3; font-size: 1.25rem;">Hành trình khứ hồi</h3>
            <p style="margin: 5px 0 0 0; color: #595959; font-size: 1rem;">
                Chiều đi: <strong>${param.diem_di}</strong> đến <strong>${param.diem_den}</strong> ngày <strong>${param.ngay_di}</strong>
                <br/>
                Chiều về: <strong>${param.diem_den}</strong> đến <strong>${param.diem_di}</strong> ngày <strong>${ngayVe}</strong>
                <c:if test="${isReturnFlexible}"> (Tìm kiếm linh hoạt ±3 ngày)</c:if>
            </p>
        </div>
    </c:if>
</div>

<div class="container flex" style="align-items: flex-start; gap: 40px; margin-bottom: 50px;">

    <div class="list-ve" style="flex: 1; min-width: 0;">
        <h1 style="color: #005aab; font-size: 22px; border-bottom: 2px solid #f0f2f5; padding-bottom: 10px; margin-bottom: 20px;">
            <c:choose>
                <c:when test="${isRoundTrip}">🛫 1. Vé chiều đi (Outbound)</c:when>
                <c:otherwise>🛫 Danh sách vé máy bay</c:otherwise>
            </c:choose>
        </h1>

        <c:choose>
            <c:when test="${not empty listVeRes}">
                <c:forEach items="${listVeRes}" var="item">
                    <div class="ticket-card">
                        <div class="ticket-airline">
                            <img src="${pageContext.request.contextPath}/access/trang_chu/Logo.png" alt="Logo" class="airline-logo">
                            <div class="airline-info">
                                <span class="airline-name">${item.hangBay}</span>
                                <span class="ticket-class">Hạng ghế: ${item.hangGhe}</span>
                            </div>
                        </div>

                        <div class="ticket-route">
                            <div class="route-point text-right">
                                <div class="route-time">${item.thoiGianKhoiHanh}</div>
                                <div class="route-station">${item.sanBayDi}</div>
                            </div>

                            <div class="route-flight-line">
                                <span class="duration">Bay thẳng</span>
                                <div class="line">
                                    <span class="dot"></span>
                                    <i class="plane-icon">✈</i>
                                    <span class="dot"></span>
                                </div>
                            </div>

                            <div class="route-point text-left">
                                <div class="route-time">${item.thoiGianHaCanh}</div>
                                <div class="route-station">${item.sanBayDen}</div>
                            </div>
                        </div>

                        <div class="ticket-action">
                            <div class="ticket-price">${item.gia} VNĐ</div>
                            <div class="action-buttons">
                                <c:url var="urlDatVe" value="/DatVeController">
                                    <c:param name="idVe" value="${item.idVe}" />
                                    <c:param name="soLuong" value="1" />
                                </c:url>
                                <a href="${urlDatVe}" class="btn-book">Chọn</a>

                                <form action="${pageContext.request.contextPath}/GioHangController" method="post" style="margin: 0;">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="idVe" value="${item.idVe}">
                                    <button type="submit" class="btn-cart" title="Thêm vào giỏ hàng">🛒</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-tickets" style="text-align: center; padding: 50px; background: #fff; border-radius: 12px; border: 1px solid #eaeaea;">
                    <img src="${pageContext.request.contextPath}/access/trang_chu/no-data-icon.png" alt="" style="width: 80px; margin-bottom: 20px; opacity: 0.5;">
                    <p style="font-size: 16px; color: #666;">Rất tiếc, hiện tại không có vé nào phù hợp với chiều đi của bạn.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${isRoundTrip}">
        <div class="list-ve" style="flex: 1; min-width: 0;">
            <h1 style="color: #005aab; font-size: 22px; border-bottom: 2px solid #f0f2f5; padding-bottom: 10px; margin-bottom: 20px;">
                🛬 2. Vé chiều về (Return)
            </h1>
            <c:choose>
                <c:when test="${not empty listVeReturn}">
                    <c:forEach items="${listVeReturn}" var="item">
                        <div class="ticket-card">
                            <div class="ticket-airline">
                                <img src="${pageContext.request.contextPath}/access/trang_chu/Logo.png" alt="Logo" class="airline-logo">
                                <div class="airline-info">
                                    <span class="airline-name">${item.hangBay}</span>
                                    <span class="ticket-class">Hạng ghế: ${item.hangGhe}</span>
                                </div>
                            </div>

                            <div class="ticket-route">
                                <div class="route-point text-right">
                                    <div class="route-time">${item.thoiGianKhoiHanh}</div>
                                    <div class="route-station">${item.sanBayDi}</div>
                                </div>

                                <div class="route-flight-line">
                                    <span class="duration">Bay thẳng</span>
                                    <div class="line">
                                        <span class="dot"></span>
                                        <i class="plane-icon" style="transform: rotate(-90deg);">✈</i> <span class="dot"></span>
                                    </div>
                                </div>

                                <div class="route-point text-left">
                                    <div class="route-time">${item.thoiGianHaCanh}</div>
                                    <div class="route-station">${item.sanBayDen}</div>
                                </div>
                            </div>

                            <div class="ticket-action">
                                <div class="ticket-price">${item.gia} VNĐ</div>
                                <div class="action-buttons">
                                    <c:url var="urlDatVe" value="/DatVeController">
                                        <c:param name="idVe" value="${item.idVe}" />
                                        <c:param name="soLuong" value="1" />
                                    </c:url>
                                    <a href="${urlDatVe}" class="btn-book">Chọn</a>

                                    <form action="${pageContext.request.contextPath}/GioHangController" method="post" style="margin: 0;">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="idVe" value="${item.idVe}">
                                        <button type="submit" class="btn-cart" title="Thêm vào giỏ hàng">🛒</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-tickets" style="text-align: center; padding: 50px; background: #fff; border-radius: 12px; border: 1px solid #eaeaea;">
                        <img src="${pageContext.request.contextPath}/access/trang_chu/no-data-icon.png" alt="" style="width: 80px; margin-bottom: 20px; opacity: 0.5;">
                        <p style="font-size: 16px; color: #666;">Rất tiếc, hiện tại không có vé nào phù hợp với chiều về của bạn.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>
</div>

<%@include file="../../layout/Footer.jsp" %>
</body>
</html>