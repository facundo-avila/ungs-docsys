package com.ungs.docsys.dtos;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CertificationResponseDto {
    private String name;
    private LocalDate issueDate;
    private LocalDate expirationDate;
    private String certificationUrl;
}
