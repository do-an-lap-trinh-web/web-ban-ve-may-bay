package com.edu.hcmuaf.fit.webbanvemaybay.services.core;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class GuiMail {


    public static boolean guiMaXacThuc(String email, String noiDung) {
        // 1. Thông tin cấu hình Email của bạn (Người gửi)
        final String fromEmail = "23130351@st.hcmuaf.edu.vn";
        final String password = "yjye wwvc jjej ssre"; // Mật khẩu ứng dụng 16 ký tự

        // 2. Thiết lập cấu hình hệ thống
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // Cho phép xác thực
        props.put("mail.smtp.starttls.enable", "true"); // Bắt buộc dùng TLS

        // 3. Tạo phiên làm việc (Session)
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // 4. Tạo tin nhắn
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Mã Xác Thực Quên Mật Khẩu", "UTF-8");

            // Gửi nội dung định dạng HTML hoặc Text
            message.setContent("<h3>Mã xác nhận của bạn là: <b style='color:red;'>" + noiDung + "</b></h3>", "text/html; charset=UTF-8");

            // 5. Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
