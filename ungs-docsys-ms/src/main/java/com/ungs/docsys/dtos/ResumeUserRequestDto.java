package com.ungs.docsys.dtos;

import jakarta.validation.Valid;
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
}
