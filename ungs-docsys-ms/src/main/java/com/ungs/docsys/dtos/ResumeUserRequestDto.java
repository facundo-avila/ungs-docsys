package com.ungs.docsys.dtos;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResumeUserRequestDto {
    @NotNull(message = "Contact must not be null")
    @Valid
    private ContactRequestDto contact;
    @Valid
    private List<EducationRequestDto> educations = new ArrayList<>();
    @Valid
    private List<ExperienceRequestDto> experiences = new ArrayList<>();
    @Valid
    private List<LanguageRequestDto> languages = new ArrayList<>();
    @Valid
    private List<TechnicalSkillRequestDto> technicalSkills = new ArrayList<>();
    @Valid
    private List<CertificationRequestDto> certifications = new ArrayList<>();
    @Valid
    private List<ContactRequestDto> references = new ArrayList<>();
    @Valid
    private List<ResumeFileRequestDto> resumeFiles = new ArrayList<>();
    @NotNull(message = "Is current must not be null")
    private Boolean isCurrent;
}
