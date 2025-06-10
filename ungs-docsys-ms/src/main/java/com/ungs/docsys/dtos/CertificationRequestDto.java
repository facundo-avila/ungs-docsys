package com.ungs.docsys.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CertificationRequestDto {
    @NotBlank(message = "Name must not be blank")
    @Size(max = 150, message = "Name must not exceed 150 characters")
    private String name;
    @NotNull(message = "Issue date must not be null")
    private LocalDate issueDate;
    private LocalDate expirationDate;
    @NotBlank(message = "Certification URL must not be blank")
    @Size(max = 250, message = "Certification URL must not exceed 250 characters")
    private String certificationUrl;
}
