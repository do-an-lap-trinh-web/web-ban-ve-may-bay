<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        <c:choose>

            <c:when test="${not empty listVeRes}">
                <c:forEach items="${listVeRes}" var="item">
                    <div class="list-ve-item">
                        <div class="info">
                            <img src="${pageContext.request.contextPath}/access/trang_chu/Logo.png" alt="">
                            <div class="info-ve">
                                <div style="display: flex; justify-content: space-between" class="info-hang-bay">
                                    <div>
                                        <span class="text-bold text-hang-bay">Hãng bay: ${item.hangBay}</span>
                                    </div>
                                    <div>
                                        <span class="text-bold text-hang-bay">Hạng ghế: ${item.hangGhe}</span>
                                    </div>
                                    <div>
                                        <span class="text-bold">Giá: ${item.gia} đồng</span>
                                    </div>

                                </div>
                                <div class="info-dia-diem">
                                    <div>
                                        <span class="text-hang-bay">Khởi Hành: ${item.sanBayDi}</span>
                                    </div>
                                    <div style="margin: 0px 20px 0px 20px">======></div>
                                    <div>
                                        <span class="text-hang-bay"> Hạ Cánh: ${item.sanBayDen}</span>
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
                            <form action="${pageContext.request.contextPath}/GioHangController" method="post"
                                  style="display:inline; margin-left: 10px">

                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="idVe" value="${item.idVe}">
                                <button type="submit" class="btn-add-cart">
                                    Thêm vào giỏ
                                </button>
                            </form>
                        </div>

                    </div>
                </c:forEach>
            </c:when>


            <c:otherwise>
                <div class="no-tickets" style="text-align: center; padding: 50px; font-size: 1.2rem; color: #666;">
                    <img src="../../access/trang_chu/no-data-icon.png" alt=""
                         style="width: 100px; margin-bottom: 20px;">
                    <p>Rất tiếc, hiện tại không có vé nào phù hợp với yêu cầu của bạn.</p>
                    <p>Vui lòng thử lại với thời gian hoặc địa điểm khác.</p>
                </div>
            </c:otherwise>
        </c:choose>


    </div>


</div>

<%@include file="../../layout/Footer.jsp" %>

</body>
</html>