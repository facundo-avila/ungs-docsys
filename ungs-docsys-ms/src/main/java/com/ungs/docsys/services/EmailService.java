package com.ungs.docsys.services;

public interface EmailService {
    void sendPasswordResetEmail(String toEmail, String resetUrl);
}
