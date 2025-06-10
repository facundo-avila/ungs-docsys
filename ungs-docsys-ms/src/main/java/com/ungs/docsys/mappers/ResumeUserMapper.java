package com.ungs.docsys.mappers;

import com.ungs.docsys.dtos.*;
import com.ungs.docsys.models.*;
import java.util.Collections;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValuePropertyMappingStrategy;

import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Function;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public abstract class ResumeUserMapper {

    public abstract ResumeUser toResumeUser(ResumeUserRequestDto dto);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract Certification toCertification(CertificationRequestDto dto, ResumeUser resumeUser);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract Contact toContact(ContactRequestDto dto, ResumeUser resumeUser);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract Education toEducation(EducationRequestDto dto, ResumeUser resumeUser);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract Experience toExperience(ExperienceRequestDto dto, ResumeUser resumeUser);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract Language toLanguage(LanguageRequestDto dto, ResumeUser resumeUser);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract ResumeFile toResumeFile(ResumeFileRequestDto dto, ResumeUser resumeUser);

    @Mapping(target = "resumeUser", source = "resumeUser")
    public abstract TechnicalSkill toTechnicalSkill(TechnicalSkillRequestDto dto, ResumeUser resumeUser);


    public List<Education> toEducationList(List<EducationRequestDto> dtos, ResumeUser resumeUser) {
        return mapList(dtos, this::toEducation, resumeUser);
    }

    public List<Experience> toExperienceList(List<ExperienceRequestDto> dtos, ResumeUser resumeUser) {
        return mapList(dtos, this::toExperience, resumeUser);
    }

    public List<Certification> toCertificationList(List<CertificationRequestDto> dtos, ResumeUser resumeUser) {
        return mapList(dtos, this::toCertification, resumeUser);
    }

    public List<Language> toLanguageList(List<LanguageRequestDto> dtos, ResumeUser resumeUser) {
        return mapList(dtos, this::toLanguage, resumeUser);
    }

    public List<ResumeFile> toResumeFileList(List<ResumeFileRequestDto> dtos, ResumeUser resumeUser) {
        return mapList(dtos, this::toResumeFile, resumeUser);
    }

    public List<TechnicalSkill> toTechnicalSkillList(List<TechnicalSkillRequestDto> dtos, ResumeUser resumeUser) {
        return mapList(dtos, this::toTechnicalSkill, resumeUser);
    }

    @Mapping(target = "contact", expression = "java(toContactResponse(resumeUser.getContacts()))")
    @Mapping(target = "educations", expression = "java(toEducationResponseList(resumeUser.getEducations()))")
    @Mapping(target = "experiences", expression = "java(toExperienceResponseList(resumeUser.getExperiences()))")
    @Mapping(target = "languages", expression = "java(toLanguageResponseList(resumeUser.getLanguages()))")
    @Mapping(target = "technicalSkills", expression = "java(toTechnicalSkillResponseList(resumeUser.getTechnicalSkills()))")
    @Mapping(target = "certifications", expression = "java(toCertificationResponseList(resumeUser.getCertifications()))")
    @Mapping(target = "files", expression = "java(toResumeFileResponseList(resumeUser.getResumeFiles()))")
    public abstract ResumeUserResponseDto toResponse(ResumeUser resumeUser);

    public ContactResponseDto toContactResponse(List<Contact> contacts) {
        if (contacts == null || contacts.isEmpty()) return null;
        return toContactResponse(contacts.get(0));
    }

    public abstract ContactResponseDto toContactResponse(Contact contact);

    public abstract EducationResponseDto toEducationResponse(Education education);

    public List<EducationResponseDto> toEducationResponseList(List<Education> educations) {
        return mapResponseList(educations, this::toEducationResponse);
    }

    public abstract ExperienceResponseDto toExperienceResponse(Experience experience);

    public List<ExperienceResponseDto> toExperienceResponseList(List<Experience> experiences) {
        return mapResponseList(experiences, this::toExperienceResponse);
    }

    public abstract CertificationResponseDto toCertificationResponse(Certification certification);

    public List<CertificationResponseDto> toCertificationResponseList(List<Certification> certifications) {
        return mapResponseList(certifications, this::toCertificationResponse);
    }

    public abstract LanguageResponseDto toLanguageResponse(Language language);

    public List<LanguageResponseDto> toLanguageResponseList(List<Language> languages) {
        return mapResponseList(languages, this::toLanguageResponse);
    }

    public abstract ResumeFileResponseDto toResumeFileResponse(ResumeFile resumeFile);

    public List<ResumeFileResponseDto> toResumeFileResponseList(List<ResumeFile> resumeFiles) {
        return mapResponseList(resumeFiles, this::toResumeFileResponse);
    }

    public abstract TechnicalSkillResponseDto toTechnicalSkillResponse(TechnicalSkill skill);

    public List<TechnicalSkillResponseDto> toTechnicalSkillResponseList(List<TechnicalSkill> skills) {
        return mapResponseList(skills, this::toTechnicalSkillResponse);
    }

    protected <D, E> List<E> mapList(List<D> source, BiFunction<D, ResumeUser, E> mapper, ResumeUser resumeUser) {
        if (source == null) return Collections.emptyList();
        return source.stream()
                .map(dto -> mapper.apply(dto, resumeUser))
                .toList();
    }

    protected <E, R> List<R> mapResponseList(List<E> source, Function<E, R> mapper) {
        if (source == null) return Collections.emptyList();
        return source.stream()
                .map(mapper)
                .toList();
    }
}
