package com.ungs.docsys.services;

import com.ungs.docsys.dtos.AppUserClaimDto;
import com.ungs.docsys.dtos.RequirementRequestDto;
import com.ungs.docsys.dtos.RequirementResponseDto;
import com.ungs.docsys.exception.BusinessException;
import com.ungs.docsys.mappers.RequirementMapper;
import com.ungs.docsys.models.Requirement;
import com.ungs.docsys.repositories.AppUserRepository;
import com.ungs.docsys.repositories.RequirementJobApplicationRepository;
import com.ungs.docsys.repositories.RequirementRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class RequirementServiceImpl implements RequirementService {
    private final RequirementRepository requirementRepository;
    private final RequirementJobApplicationRepository requirementJobApplicationRepository;
    private final AppUserRepository appUserRepository;
    private final RequirementMapper requirementMapper;

    @Override
    public RequirementResponseDto getById(Long id) {
        return requirementRepository.findById(id)
                .map(requirementMapper::toResponse)
                .orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "Requirement not found"));
    }

    @Override
    public Page<RequirementResponseDto> getByParams(Pageable pageable) {
        return requirementRepository.findAll(pageable)
                .map(requirementMapper::toResponse);
    }

    @Override
    public RequirementResponseDto save(RequirementRequestDto requirementRequestDto, AppUserClaimDto appUserClaimDto) {
        final Requirement requirement = requirementMapper.toModel(requirementRequestDto);
        requirement.setAppUser(appUserRepository.findById(appUserClaimDto.getId()).orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "User not found")));
        return requirementMapper.toResponse(requirementRepository.save(requirement));
    }

    @Override
    public RequirementResponseDto partiallyUpdate(RequirementRequestDto requirementRequestDto, Long id, AppUserClaimDto appUserClaimDto) {
        final Requirement requirement = requirementRepository.findById(id)
                .orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "Requirement not found"));
        requirementMapper.updateModelFromDto(requirementRequestDto, requirement);
        requirement.setAppUser(appUserRepository.findById(appUserClaimDto.getId()).orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "User not found")));
        return requirementMapper.toResponse(requirementRepository.save(requirement));
    }

    @Override
    public List<RequirementResponseDto> getByJobApplicationId(Long jobApplicationId) {
        return List.of();
    }
}
