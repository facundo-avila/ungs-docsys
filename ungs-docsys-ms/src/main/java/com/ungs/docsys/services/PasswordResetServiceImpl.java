package com.ungs.docsys.services;

import com.ungs.docsys.dtos.PasswordResetResponseDto;
import com.ungs.docsys.exception.BusinessException;
import com.ungs.docsys.mappers.AppUserMapper;
import com.ungs.docsys.models.AppUser;
import com.ungs.docsys.models.PasswordReset;
import com.ungs.docsys.repositories.AppUserRepository;
import com.ungs.docsys.repositories.PasswordResetRepository;
import com.ungs.docsys.utils.PasswordValidatorUtils;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
@AllArgsConstructor
public class PasswordResetServiceImpl implements PasswordResetService {
    private final PasswordResetRepository passwordResetRepository;
    private final AppUserRepository appUserRepository;
    private final AppUserMapper appUserMapper;
    private final AppUserService appUserService;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;
    private final int EXPIRATION_MINUTES = 30;

    @Override
    public PasswordReset createResetToken(AppUser user) {
        PasswordReset passwordReset = PasswordReset.builder()
                .appUser(user)
                .expirationDate(LocalDateTime.now().plusMinutes(EXPIRATION_MINUTES))
                .used(false).build();
        return passwordResetRepository.save(passwordReset);
    }

    @Override
    public Optional<AppUser> validateToken(String token) {
        return passwordResetRepository.findByToken(token)
                .filter(resetPassword -> !resetPassword.getUsed() && resetPassword.getExpirationDate().isAfter(LocalDateTime.now()))
                .map(PasswordReset::getAppUser);
    }

    @Override
    public void markTokenAsUsed(String token) {
        passwordResetRepository.findByToken(token).ifPresent(resetPassword -> {
            resetPassword.setUsed(true);
            passwordResetRepository.save(resetPassword);
        });
    }

    @Override
    public PasswordResetResponseDto resetPassword(String token, String newPassword) {
        if (!PasswordValidatorUtils.isValid(newPassword))
            return new PasswordResetResponseDto(false,
                    "The password must have at least 8 characters, one letter, one number and one special character.");

        Optional<AppUser> appUser = validateToken(token);
        if (appUser.isEmpty())
            return new PasswordResetResponseDto(false, "Invalid or expired token");

        AppUser user = appUser.get();
        user.setPasswordHash(passwordEncoder.encode(newPassword));
        appUserRepository.save(user);
        markTokenAsUsed(token);
        return new PasswordResetResponseDto(true, "Password changed successfully");
    }

    @Override
    public PasswordResetResponseDto handleForgotPassword(String email) {
        try {
            AppUser user = appUserMapper.toModel(appUserService.getByUsername(email));
            PasswordReset passwordReset = createResetToken(user);
            emailService.sendPasswordResetEmail(email, passwordReset.getToken());
        } catch (BusinessException ignored) {}
        return new PasswordResetResponseDto(true, "If the email exists, a reset link has been sent.");
    }
}
