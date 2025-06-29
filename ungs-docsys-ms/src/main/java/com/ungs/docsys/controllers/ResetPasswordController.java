package com.ungs.docsys.controllers;

import com.ungs.docsys.dtos.PasswordResetRequestDto;
import com.ungs.docsys.dtos.PasswordResetResponseDto;
import com.ungs.docsys.services.PasswordResetService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/auth")
@AllArgsConstructor
@Validated
public class ResetPasswordController {
    private PasswordResetService passwordResetService;

    @PostMapping("/forgot-password")
    public ResponseEntity<PasswordResetResponseDto> forgotPassword(@RequestParam String email) {
        return ResponseEntity.ok(passwordResetService.handleForgotPassword(email));
    }

    @PostMapping("/reset-password")
    public ResponseEntity<PasswordResetResponseDto> resetPassword(@RequestBody PasswordResetRequestDto request) {
        return ResponseEntity.ok(passwordResetService.resetPassword(request.getToken(), request.getNewPassword()));
    }
}
