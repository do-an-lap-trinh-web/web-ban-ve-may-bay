<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách vé đã đặt</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/list_ve_da_dat/list_ve_da_dat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">

</head>
<body>
<%@ include file="../../layout/Header.jsp" %>

<div class="list-ve">
    <h1>Danh sách vé máy bay đã đặt</h1>

    <div class="list-ve-item">
        <c:choose>
            <c:when test="${not empty listVeDaDat}">
                <c:forEach var="item" items="${listVeDaDat}">
                    <div class="flight-card">
                        <div class="card-header">
                            <span class="airline-name">
                                <svg class="plane-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M21 16V14.5L14 10V3C14 2.45 13.55 2 13 2H11C10.45 2 10 2.45 10 3V10L3 14.5V16L10 13V20L8.5 22H9.5L12 21L14.5 22H15.5L14 20V13L21 16Z" fill="currentColor"/>
                                </svg>
                                ${item.veDto.hangBay}
                            </span>
                            <div class="flight-times">
                                <div class="time-detail departure">
                                    <span class="label">Cất cánh</span>
                                    <span>${item.veDto.thoiGianKhoiHanh}</span>
                                </div>
                                <div class="time-detail arrival">
                                    <span class="label">Hạ cánh</span>
                                    <span>${item.veDto.thoiGianHaCanh}</span>
                                </div>
                            </div>
                        </div>

                        <hr class="separator">

                        <div class="card-body">
                            <div class="airport departure">
                                <span class="airport-code">${item.veDto.diemDi}</span>
                                <span class="airport-name">${item.veDto.khoiHanh}</span>
                            </div>
                            <div class="route-icon">
                                <span class="arrow">→</span>
                            </div>
                            <div class="airport arrival">
                                <span class="airport-code">${item.veDto.diemDen}</span>
                                <span class="airport-name">${item.veDto.haCanh}</span>
                            </div>
                        </div>

                        <div class="card-footer">
                            <span class="quantity">Số lượng: ${item.soLuong}</span>
                            <span class="price">Giá: ${item.veDto.gia}đ</span>
                            <button onclick="OpenXacNhan()" class="cancel-button">Hủy vé</button>
                        </div>
                    </div>
                </c:forEach>
            </c:when>


            <c:otherwise>
                <div class="no-tickets-message" style="text-align: center; padding: 50px; background: #fff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                    <p style="font-size: 1.2rem; color: #666; margin-top: 20px;">Bạn chưa có vé máy bay nào đã đặt.</p>
                </div>
            </c:otherwise>
        </c:choose>
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