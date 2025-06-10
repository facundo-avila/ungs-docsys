package com.ungs.docsys.services;

import com.ungs.docsys.dtos.AppUserClaimDto;
import com.ungs.docsys.dtos.ResumeUserRequestDto;
import com.ungs.docsys.dtos.ResumeUserResponseDto;
import com.ungs.docsys.mappers.AppUserMapper;
import com.ungs.docsys.mappers.ResumeUserMapper;
import com.ungs.docsys.models.*;
import com.ungs.docsys.repositories.*;
import jakarta.persistence.EntityNotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;

@Service
@AllArgsConstructor
public class ResumeUserServiceImpl implements ResumeUserService {

    private final ResumeUserMapper resumeUserMapper;
    private final AppUserMapper appUserMapper;

    private final AppUserService appUserService;
    private final ResumeUserRepository resumeUserRepository;

    @Override
    public ResumeUserResponseDto save(ResumeUserRequestDto request, AppUserClaimDto appUserClaimDto) {
        AppUser appUser = appUserMapper.toModel(appUserService.getByUsername(appUserClaimDto.getEmail()));

        if (appUser == null) {
            throw new IllegalArgumentException("User not found for email: " + appUserClaimDto.getEmail());
        }

        if (resumeUserRepository.findByAppUserId(appUser.getId()).isPresent()) {
            throw new IllegalStateException("Resume already exists for user ID: " + appUserClaimDto.getId());
        }

        ResumeUser resumeUser = resumeUserMapper.toResumeUser(request);
        resumeUser.setAppUser(appUser);

        resumeUser.setContacts(
                Optional.ofNullable(request.getContact())
                        .map(c -> new ArrayList<>(List.of(resumeUserMapper.toContact(c, resumeUser))))
                        .orElseGet(ArrayList::new)
        );

        mapAndSetList(request.getEducations(), dto -> resumeUserMapper.toEducation(dto, resumeUser), resumeUser::setEducations);
        mapAndSetList(request.getExperiences(), dto -> resumeUserMapper.toExperience(dto, resumeUser), resumeUser::setExperiences);
        mapAndSetList(request.getLanguages(), dto -> resumeUserMapper.toLanguage(dto, resumeUser), resumeUser::setLanguages);
        mapAndSetList(request.getTechnicalSkills(), dto -> resumeUserMapper.toTechnicalSkill(dto, resumeUser), resumeUser::setTechnicalSkills);
        mapAndSetList(request.getCertifications(), dto -> resumeUserMapper.toCertification(dto, resumeUser), resumeUser::setCertifications);
        mapAndSetList(request.getResumeFiles(), dto -> resumeUserMapper.toResumeFile(dto, resumeUser), resumeUser::setResumeFiles);

        ResumeUser savedResumeUser = resumeUserRepository.save(resumeUser);
        return resumeUserMapper.toResponse(savedResumeUser);
    }

    private <D, E> void mapAndSetList(List<D> dtos, Function<D, E> mapper, Consumer<List<E>> setter) {
        setter.accept(dtos == null ? List.of() : dtos.stream().map(mapper).toList());
    }

    @Override
    public ResumeUserResponseDto getById(Long resumeUserId) {
        ResumeUser resumeUser = resumeUserRepository.findByAppUserId(resumeUserId)
                .orElseThrow(() -> new EntityNotFoundException("Resume not found for user ID: " + resumeUserId));
        return resumeUserMapper.toResponse(resumeUser);
    }

    @Override
    public Page<ResumeUserRequestDto> getByParams(Pageable pageable) {
        return null;
    }

    @Override
    public ResumeUserResponseDto partiallyUpdate(ResumeUserRequestDto resumeUserRequestDto, Long resumeUserId, AppUserClaimDto appUserClaimDto) {
        return null;
    }

    @Override
    public ResumeUserResponseDto getResumeByUserId(Long userId) {
        return null;
    }
}
