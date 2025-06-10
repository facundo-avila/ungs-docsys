package com.ungs.docsys.dtos;

import java.time.LocalDate;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExperienceRequestDto {
    @NotBlank(message = "Job title must not be blank")
    @Size(max = 150, message = "Job title must not exceed 150 characters")
    private String jobTitle;
    @NotBlank(message = "Company name must not be blank")
    @Size(max = 150, message = "Company name must not exceed 150 characters")
    private String companyName;
    @NotBlank(message = "Description must not be blank")
    @Size(max = 5000, message = "Description must not exceed 5000 characters")
    private String description;
    @NotNull(message = "Start date must not be null")
    private LocalDate startDate;
    private LocalDate endDate;
    @NotNull(message = "isCurrentJob must not be null")
    private Boolean isCurrentJob;
}
