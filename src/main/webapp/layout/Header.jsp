<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="loading-overlay">
    <div class="loading-spinner"></div>
</div>

<header class="main-header">
    <div class="header-container">

        <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
            <img src="${pageContext.request.contextPath}/access/trang_chu/Logo.png" alt="Logo MáyBayOnline" style="height: 35px; width: auto;">
            MáyBayOnline
        </a>

        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang Chủ</a>

            <c:url var="urlTimVe" value="/ThongTinTimVeController">
                <c:param name="khoiHanh" value="Việt Nam" />
                <c:param name="haCanh" value="Việt Nam" />
            </c:url>
            <a href="${urlTimVe}">Đặt Vé</a>

            <a href="${pageContext.request.contextPath}/page/thong_tin_ve_noi_dia/ve_noi_dia.jsp">Vé Nội Địa</a>
            <a href="${pageContext.request.contextPath}/page/thong_tin_ve_quoc_te/ve_quoc_te.jsp">Vé Quốc Tế</a>
            <a href="${pageContext.request.contextPath}/ThongTinLienHeController">Thông Tin Liên Hệ</a>
            <a href="${pageContext.request.contextPath}/VeDaDatController">Vé đã đặt</a>

            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/admin/user-controller">Admin</a>
            </c:if>
        </nav>

        <div class="user-actions">
            <a href="${pageContext.request.contextPath}/GioHangController" class="cart-icon" title="Giỏ hàng">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg>
            </a>

            <div class="user-menu">
                <c:if test="${sessionScope.user == null}">
                    <a href="${pageContext.request.contextPath}/page/dang_nhap/dang_nhap.jsp" class="auth-link">Đăng Nhập</a>
                    <span style="color: #ccc;">|</span>
                    <a href="${pageContext.request.contextPath}/page/dang_ky/dang_ky.jsp" class="auth-link">Đăng Ký</a>
                </c:if>

                <c:if test="${sessionScope.user != null}">
                    <a href="${pageContext.request.contextPath}/ThongTinNguoiDungController?id=${sessionScope.user.id}" class="username">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle>
                        </svg>
                            ${sessionScope.user.username}
                    </a>

                    <form action="${pageContext.request.contextPath}/DangXuatController" method="post" style="margin: 0;">
                        <button class="logout-btn" type="submit">Đăng Xuất</button>
                    </form>
                </c:if>
            </div>
        </div>

    </div>
</header>

<script>
document.addEventListener("DOMContentLoaded", function () {
    var loader = document.getElementById('loading-overlay');

    if (loader) {
        setTimeout(function() {
            loader.classList.add('loading-hidden');
        }, 150);
    }

    document.body.addEventListener('click', function (e) {
        var anchor = e.target.closest('a');
        if (anchor) {
            var href = anchor.getAttribute('href');
            var target = anchor.getAttribute('target');

            if (href && !href.startsWith('#') && href !== 'javascript:void(0);' && target !== '_blank') {
                if (loader) {
                    loader.classList.remove('loading-hidden');
                }
            }
        }
    });

    document.body.addEventListener('submit', function () {
        if (loader) {
            loader.classList.remove('loading-hidden');
        }
    });
});
</script>