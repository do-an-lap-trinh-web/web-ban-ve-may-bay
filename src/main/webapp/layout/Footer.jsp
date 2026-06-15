<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="main-footer">
    <div class="footer-container">

        <div class="footer-col">
            <h3>Máy Bay Online</h3>
            <p>Hệ thống đặt vé máy bay trực tuyến hàng đầu Việt Nam. Nhanh chóng, an toàn và luôn có mức giá tốt nhất cho mọi hành trình của bạn</p>
        </div>

        <div class="footer-col">
            <h3>Dịch Vụ</h3>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a></li>
                <li>
                    <c:url var="urlTimVe" value="/ThongTinTimVeController">
                        <c:param name="khoiHanh" value="Việt Nam"/>
                        <c:param name="haCanh" value="Việt Nam"/>
                    </c:url>
                    <a href="${urlTimVe}">Đặt Vé</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/page/thong_tin_ve_noi_dia/ve_noi_dia.jsp">Vé nội địa</a></li>
                <li><a href="${pageContext.request.contextPath}/page/thong_tin_ve_quoc_te/ve_quoc_te.jsp">Vé quốc tế</a></li>
                <li><a href="${pageContext.request.contextPath}/ThongTinLienHeController">Thông tin liên hệ</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h3>Liên Hệ</h3>
            <p><strong>Địa chỉ:</strong> ${daiLy.tenDiaChi}</p>
            <p><strong>Email:</strong> ${daiLy.email}</p>
            <p class="hotline">Hỗ trợ đặt vé: <strong>0814280305</strong></p>

            <div class="social-icons">
                <a href="${daiLy.linkYt}" target="_blank" title="YouTube">
                    <svg viewBox="0 0 24 24"><path d="M19.615 3.184c-3.604-.246-11.631-.245-15.23 0-3.897.266-4.356 2.62-4.385 8.816.029 6.185.484 8.549 4.385 8.816 3.6.245 11.626.246 15.23 0 3.897-.266 4.356-2.62 4.385-8.816-.029-6.185-.484-8.549-4.385-8.816zm-10.615 12.816v-8l8 3.993-8 4.007z"/></svg>
                </a>
                <a href="${daiLy.linkFb}" target="_blank" title="Facebook">
                    <svg viewBox="0 0 24 24"><path d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z"/></svg>
                </a>
                <a href="${daiLy.linkTiktok}" target="_blank" title="TikTok">
                    <svg viewBox="0 0 24 24"><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.35-4.2-.97-.57-.26-1.1-.59-1.62-.93-.01 2.92.01 5.84-.02 8.75-.08 1.4-.54 2.79-1.35 3.94-1.31 1.92-3.58 3.17-5.91 3.21-1.43.08-2.86-.31-4.08-1.03-2.02-1.12-3.44-3.17-3.64-5.44-.05-1.28.18-2.58.74-3.73.96-1.95 2.87-3.32 4.98-3.53 1.25-.13 2.53.07 3.66.58v4.06c-.46-.38-.99-.61-1.57-.7-1.1-.14-2.22.12-3.08.79-.81.65-1.35 1.6-1.4 2.64-.06 1.13.38 2.22 1.15 3.03.82.84 2.01 1.25 3.19 1.11 1.48-.15 2.72-1.19 3.09-2.61.16-.62.24-1.26.24-1.91V0l-2.06.02z"/></svg>
                </a>
            </div>
        </div>

        <div class="footer-col">
            <h3>Đăng Ký Nhận Khuyến Mãi</h3>
            <p>Nhập email để không bỏ lỡ các deal vé máy bay giá sốc mỗi ngày</p>
            <div class="newsletter-form">
                <input type="email" placeholder="Nhập email của bạn...">
                <button type="button">Gửi</button>
            </div>
        </div>

    </div>

    <div class="footer-bottom">
        <p>&copy; 2026 MáyBayOnline </p>
    </div>
</footer>

<a id="back-to-top" href="#" title="Về đầu trang">&#8679;</a>

<script>
    (function () {
        var btn = document.getElementById('back-to-top');

        window.addEventListener('scroll', function () {
            if (window.scrollY > 300) {
                btn.classList.add('show');
            } else {
                btn.classList.remove('show');
            }
        });

        btn.addEventListener('click', function (e) {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    })();
</script>