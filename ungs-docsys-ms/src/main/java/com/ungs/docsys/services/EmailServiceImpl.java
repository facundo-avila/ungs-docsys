package com.ungs.docsys.services;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

@Service
public class EmailServiceImpl implements EmailService{
    @Value("${app.reset-password.url.base}")
    private String URL_RESET_PASSWORD;
    private final String SUBJECT_RESET_PASSWORD = "Recuperación de contraseña";
    private final String TEMPLATE_RESET_PASSWORD = "templates/reset-password-template.html";

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendPasswordResetEmail(String toEmail, String resetUrl) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setTo(toEmail);
            helper.setSubject(SUBJECT_RESET_PASSWORD);
            helper.setText(buildResetPasswordEmail(URL_RESET_PASSWORD + resetUrl), true);
            mailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException("Error sending recovery email", e);
        }
    }

    private String buildResetPasswordEmail(String resetUrl) {
        try {
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream(TEMPLATE_RESET_PASSWORD);
            if (inputStream == null)
                throw new FileNotFoundException("Email template not found");
            String html = new String(inputStream.readAllBytes(), StandardCharsets.UTF_8);
            return html.replace("{{RESET_URL}}", resetUrl);
        } catch (IOException e) {
            throw new RuntimeException("Error loading email template", e);
        }
    }

}
