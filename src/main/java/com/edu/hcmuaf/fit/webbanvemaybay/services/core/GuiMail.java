package com.edu.hcmuaf.fit.webbanvemaybay.services.core;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class GuiMail {


    public static boolean guiMaXacThuc(String email, String noiDung) {

        final String fromEmail = "23130351@st.hcmuaf.edu.vn";
        final String password = "yjye wwvc jjej ssre";


        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");


        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Mã Xác Thực Quên Mật Khẩu", "UTF-8");


            message.setContent("<h3>Mã xác nhận của bạn là: <b style='color:red;'>" + noiDung + "</b></h3>", "text/html; charset=UTF-8");


            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static void sendVerificationEmail(String toEmail, String code) {
        final String fromEmail = "23130351@st.hcmuaf.edu.vn";
        final String password = "yjye wwvc jjej ssre";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            msg.setSubject("Xác thực tài khoản Web Bán Vé Máy Bay");

            String link = "http://localhost:8080/web_ban_ve_may_bay_war_exploded/VerifyController?email=" + toEmail + "&code=" + code;
            msg.setContent("<h3>Chào mừng bạn!</h3><p>Vui lòng nhấn vào link để kích hoạt tài khoản: "
                    + "<a href='" + link + "'>Xác nhận ngay</a></p>", "text/html; charset=UTF-8");

            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
