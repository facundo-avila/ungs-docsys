package com.ungs.docsys.services;

import com.ungs.docsys.dtos.PasswordResetResponseDto;
import com.ungs.docsys.models.AppUser;
import com.ungs.docsys.models.PasswordReset;

import java.util.Optional;

public interface PasswordResetService {
    PasswordReset createResetToken(AppUser user);
    Optional<AppUser> validateToken(String token);
    void markTokenAsUsed(String token);
    PasswordResetResponseDto resetPassword(String token, String newPassword);
    PasswordResetResponseDto handleForgotPassword(String email);
}
