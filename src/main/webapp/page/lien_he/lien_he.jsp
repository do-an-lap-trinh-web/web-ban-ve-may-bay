<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8">
	<title>Liên hệ với chúng tôi</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/page/lien_he/lien_he.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleHeader.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/StyleFooter.css">
</head>
<body>
<%@include file="../../layout/Header.jsp"%>

<div class="contact-container">
	<h1 class="page-title">THÔNG TIN LIÊN HỆ MÁY BAY ONLINE</h1>

	<div class="top-section">

		<div class="info-form-wrapper">
			<div class="info-box">
				<div class="info-item">
					<div class="info-icon">
						<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
					</div>
					<div class="info-text">
						<h4>Địa chỉ trụ sở</h4>
						<p>${daiLy.diaChi}</p>
					</div>
				</div>
				<div class="info-item">
					<div class="info-icon">
						<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
					</div>
					<div class="info-text">
						<h4>Tổng đài hỗ trợ</h4>
						<p>${daiLy.soDienThoai}</p>
					</div>
				</div>
				<div class="info-item">
					<div class="info-icon">
						<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
					</div>
					<div class="info-text">
						<h4>Email liên hệ</h4>
						<p>${daiLy.email}</p>
					</div>
				</div>
			</div>

			<div class="contact-form">
				<c:if test="${sessionScope.contactMessage != null}">
					<p style="font-weight: bold; color: #28a745; margin-bottom: 15px;">${sessionScope.contactMessage}</p>
					<c:remove var="contactMessage" scope="session"/> </c:if>
				<h3>Gửi yêu cầu hỗ trợ</h3>
				<form action="${pageContext.request.contextPath}/ThongTinLienHeController" method="POST">					<div class="form-group">
						<input type="text" name="hoTen" placeholder="Họ và tên của bạn" required>
					</div>
					<div class="form-group">
						<input type="email" name="email" placeholder="Email liên hệ" required>
					</div>
					<div class="form-group">
						<textarea name="noiDung" placeholder="Nội dung bạn cần hỗ trợ..." required></textarea>
					</div>
					<button type="submit" class="submit-btn">Gửi Yêu Cầu</button>
				</form>
			</div>
		</div>

		<div class="map-wrapper">
			${daiLy.tenDiaChi}
		</div>
	</div>

	<div class="faq-section">
		<h3>Câu Hỏi Thường Gặp (FAQ)</h3>

		<h4 class="faq-category">A. Đặt vé & Thông tin chuyến bay</h4>
		<div class="faq-item">
			<div class="faq-question">1. Làm thế nào để đổi ngày bay hoặc hoàn vé máy bay? <span>▼</span></div>
			<div class="faq-answer">Bạn có thể yêu cầu đổi/hoàn vé tại mục "Vé đã đặt" nếu điều kiện hạng vé cho phép. Lưu ý: Vé khuyến mãi thường không được hoàn/hủy. Bạn sẽ phải trả phí chênh lệch giá vé (nếu có).</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">2. Tôi lỡ điền sai tên khi đặt vé, có sửa được không? <span>▼</span></div>
			<div class="faq-answer">Hầu hết các hãng hàng không cho phép sửa lỗi sai tên nhỏ (sai 1-2 ký tự, ngược họ tên). Tuy nhiên, không thể thay đổi hoàn toàn sang tên người khác. Vui lòng gửi yêu cầu hỗ trợ ngay lập tức.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">3. Chuyến bay của tôi bị delay/hủy, tôi phải làm sao? <span>▼</span></div>
			<div class="faq-answer">Nếu chuyến bay bị thay đổi giờ do hãng, chúng tôi sẽ thông báo cho bạn qua Email/SĐT. Bạn có quyền yêu cầu đổi sang chuyến bay khác cùng hành trình miễn phí hoặc hoàn tiền theo chính sách của hãng.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">4. Tôi có thể đặt vé máy bay hộ người khác được không? <span>▼</span></div>
			<div class="faq-answer">Hoàn toàn được. Ở bước nhập thông tin hành khách, bạn chỉ cần điền đúng Họ tên, Ngày sinh và Giới tính của người sẽ bay. Email và SĐT liên hệ có thể để thông tin của bạn.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">5. Có thể chọn chỗ ngồi trước khi lên máy bay không? <span>▼</span></div>
			<div class="faq-answer">Có. Bạn có thể chọn chỗ ngồi có thu phí trong lúc đặt vé, hoặc chờ đến lúc làm thủ tục Check-in Online (trước 24h bay) để chọn chỗ miễn phí (tùy thuộc vào số ghế còn trống).</div>
		</div>

		<h4 class="faq-category">B. Hành lý & Thủ tục lên máy bay</h4>
		<div class="faq-item">
			<div class="faq-question">6. Tiêu chuẩn hành lý xách tay là bao nhiêu kg? <span>▼</span></div>
			<div class="faq-answer">Mức tiêu chuẩn chung của hầu hết các hãng (Vietjet, Bamboo, Vietnam Airlines) là 1 kiện xách tay nặng tối đa 7kg, kích thước không vượt quá 56cm x 36cm x 23cm.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">7. Giá vé đã bao gồm hành lý ký gửi chưa? <span>▼</span></div>
			<div class="faq-answer">Vietnam Airlines và Bamboo Airways (tùy hạng vé) thường có sẵn 20kg ký gửi. Với Vietjet Air hoặc vé siêu tiết kiệm, hành lý ký gửi KHÔNG bao gồm, bạn phải mua thêm.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">8. Tôi muốn mua thêm hành lý ký gửi sau khi đã xuất vé được không? <span>▼</span></div>
			<div class="faq-answer">Được. Bạn có thể mua thêm hành lý qua website tối thiểu 3 tiếng trước giờ khởi hành. Lưu ý: Mua trước qua website luôn rẻ hơn mua trực tiếp tại sân bay.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">9. Cần có mặt tại sân bay trước bao nhiêu lâu? <span>▼</span></div>
			<div class="faq-answer">Đối với chuyến bay nội địa, bạn nên có mặt trước 2 tiếng. Đối với chuyến bay quốc tế, bạn cần có mặt trước 3 tiếng để đảm bảo đủ thời gian làm thủ tục và kiểm tra an ninh.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">10. Trẻ em và em bé đi máy bay cần giấy tờ gì? <span>▼</span></div>
			<div class="faq-answer">Trẻ em dưới 14 tuổi cần mang theo Giấy khai sinh bản chính (hoặc bản sao trích lục). Trẻ từ 14 tuổi trở lên bắt buộc phải dùng CCCD hoặc Hộ chiếu.</div>
		</div>

		<h4 class="faq-category">C. Thanh toán & Tài khoản</h4>
		<div class="faq-item">
			<div class="faq-question">11. Hệ thống chấp nhận những hình thức thanh toán nào? <span>▼</span></div>
			<div class="faq-answer">Chúng tôi hỗ trợ đa dạng hình thức: Thanh toán qua Thẻ tín dụng/ghi nợ (Visa/Mastercard), Chuyển khoản ngân hàng (Internet Banking), và các ví điện tử (MoMo, VNPay).</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">12. Tiền đã bị trừ nhưng tôi không nhận được mã vé (PNR)? <span>▼</span></div>
			<div class="faq-answer">Đôi khi hệ thống ngân hàng bị nghẽn. Nếu tiền đã trừ, vui lòng chờ trong 15 phút và kiểm tra hộp thư rác (Spam) trong Email. Nếu vẫn không có, hãy gửi yêu cầu hỗ trợ kèm hình chụp giao dịch.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">13. Quên mật khẩu đăng nhập tài khoản thì phải làm sao? <span>▼</span></div>
			<div class="faq-answer">Tại trang Đăng nhập, nhấp vào nút "Quên mật khẩu", điền Email của bạn để nhận mã khôi phục. Hoặc bạn có thể dùng tính năng Đăng nhập nhanh bằng Google.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">14. Phụ nữ mang thai có được đi máy bay không? <span>▼</span></div>
			<div class="faq-answer">Được phép. Tuy nhiên, thai phụ từ tuần 28 đến tuần 32 cần có giấy xác nhận sức khỏe của bác sĩ. Thai phụ trên 32 tuần (hoặc 36 tuần tùy hãng) thường bị từ chối vận chuyển để đảm bảo an toàn.</div>
		</div>
		<div class="faq-item">
			<div class="faq-question">15. Giá vé hiển thị đã bao gồm thuế phí chưa? <span>▼</span></div>
			<div class="faq-answer">Giá vé hiển thị ở bước thanh toán cuối cùng là giá TỔNG CỘNG, đã bao gồm toàn bộ thuế VAT, phí sân bay và phí xuất vé. Không phát sinh thêm bất kỳ chi phí ẩn nào.</div>
		</div>
	</div>
</div>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var questions = document.querySelectorAll('.faq-question');
		questions.forEach(function(question) {
			question.addEventListener('click', function() {
				var answer = this.nextElementSibling;
				if (answer.style.display === 'block') {
					answer.style.display = 'none';
				} else {
					answer.style.display = 'block';
				}
			});
		});
	});
</script>

<%@include file="../../layout/Footer.jsp"%>
</body>
</html>