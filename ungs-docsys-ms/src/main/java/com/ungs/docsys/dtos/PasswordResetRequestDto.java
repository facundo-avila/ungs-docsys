package com.ungs.docsys.dtos;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class PasswordResetRequestDto {
    private String token;
    @NotBlank(message = "Password is required")
    private String newPassword;
}
