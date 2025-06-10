package com.ungs.docsys.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResumeUserResponseDto {
    private ContactResponseDto contact;
    private List<EducationResponseDto> educations;
    private List<ExperienceResponseDto> experiences;
    private List<LanguageResponseDto> languages;
    private List<TechnicalSkillResponseDto> technicalSkills;
    private List<CertificationResponseDto> certifications;
    private List<ResumeFileResponseDto> files;
}

