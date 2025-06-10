package com.ungs.docsys.dtos;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExperienceResponseDto {
    private String jobTitle;
    private String companyName;
    private String description;
    private LocalDate startDate;
    private LocalDate endDate;
    private Boolean isCurrentJob;
}
