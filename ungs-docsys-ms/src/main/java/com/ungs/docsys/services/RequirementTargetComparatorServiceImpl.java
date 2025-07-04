package com.ungs.docsys.services;

import com.ungs.docsys.dtos.RequirementTargetComparatorResponseDto;
import com.ungs.docsys.exception.BusinessException;
import com.ungs.docsys.mappers.RequirementTargetComparatorMapper;
import com.ungs.docsys.repositories.RequirementTargetComparatorRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class RequirementTargetComparatorServiceImpl implements  RequirementTargetComparatorService {
    private final RequirementTargetComparatorRepository requirementTargetComparatorRepository;
    private final RequirementTargetComparatorMapper requirementTargetComparatorMapper;

    @Override
    public RequirementTargetComparatorResponseDto getById(Long id) {
        return requirementTargetComparatorRepository.findById(id)
                .map(requirementTargetComparatorMapper::toResponse)
                .orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "Requirement target comparator not found"));
    }

    @Override
    public List<RequirementTargetComparatorResponseDto> getAll() {
        return requirementTargetComparatorMapper.toResponses(requirementTargetComparatorRepository.findAll());
    }
}
