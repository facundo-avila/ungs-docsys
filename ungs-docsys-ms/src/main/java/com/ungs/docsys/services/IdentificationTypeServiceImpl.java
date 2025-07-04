package com.ungs.docsys.services;

import com.ungs.docsys.dtos.IdentificationTypeResponseDto;
import com.ungs.docsys.exception.BusinessException;
import com.ungs.docsys.mappers.IdentificationTypeMapper;
import com.ungs.docsys.repositories.IdentificationTypeRepository;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class IdentificationTypeServiceImpl implements IdentificationTypeService {
    private final IdentificationTypeRepository identificationTypeRepository;
    private final IdentificationTypeMapper identificationTypeMapper;

    @Override
    public IdentificationTypeResponseDto getById(Long id) {
        return identificationTypeRepository.findById(id)
                .map(identificationTypeMapper::toResponse)
                .orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "Identification type not found"));
    }

    @Override
    public List<IdentificationTypeResponseDto> getAll() {
        return identificationTypeMapper.toResponses(identificationTypeRepository.findAll());
    }
}