package com.ungs.docsys.services;

import com.ungs.docsys.dtos.*;
import com.ungs.docsys.exception.BusinessException;
import com.ungs.docsys.mappers.JobApplicationMapper;
import com.ungs.docsys.mappers.RequirementMapper;
import com.ungs.docsys.models.JobApplication;
import com.ungs.docsys.models.JobApplicationResumeUser;
import com.ungs.docsys.models.RequirementJobApplication;
import com.ungs.docsys.repositories.*;
import com.ungs.docsys.utils.ExcelExportUtils;
import lombok.AllArgsConstructor;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class JobApplicationServiceImpl implements JobApplicationService {

    public static final Long PENDING_APPROVAL_ID = 1L;
    private final JobApplicationRepository jobApplicationRepository;
    private final RequirementJobApplicationRepository requirementJobApplicationRepository;
    private final RequirementService requirementService;
    private final JobApplicationMapper jobApplicationMapper;
    private final RequirementMapper requirementMapper;
    private final AppUserRepository appUserRepository;

    private final JobApplicationResumeUserRepository jobApplicationResumeUserRepository;

    @Override
    @Transactional
    public JobApplicationResponseDto create(JobApplicationRequestDto request, AppUserClaimDto appUserClaimDto) {
        request.setJobApplicationStatusId(PENDING_APPROVAL_ID);
        final List<RequirementResponseDto> requirementResponseDtos = request.getRequirements()
                .stream()
                .map(requirementRequestDto -> requirementService.save(requirementRequestDto, appUserClaimDto))
                .toList();
        final JobApplication jobApplication = jobApplicationMapper.toModel(request);
        jobApplication.setAppUser(appUserRepository
                .findById(appUserClaimDto.getId()).orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "User not found")));
        final JobApplication jobApplicationSaved = jobApplicationRepository.save(jobApplication);
        requirementResponseDtos.forEach(requirementResponseDto -> {
            requirementJobApplicationRepository.save(RequirementJobApplication.builder()
                    .requirement(requirementMapper.responseToModel(requirementResponseDto))
                    .jobApplication(jobApplicationSaved)
                    .build());
        });
        final JobApplicationResponseDto jobApplicationResponseDto = jobApplicationMapper.toResponse(jobApplicationSaved);
        jobApplicationResponseDto.setRequirements(requirementResponseDtos);
        return jobApplicationResponseDto;
    }

    @Override
    public boolean delete(Long id) {
        JobApplication jobApplication = getJobApplicationById(id);

        if (Boolean.TRUE.equals(jobApplication.getActive())) {
            jobApplication.setActive(false);
            jobApplicationRepository.save(jobApplication);
            return true;
        }
        return false;
    }

    @Override
    public JobApplicationResponseDto partiallyUpdate(Long id, JobApplicationRequestDto request) {
        final JobApplication jobApplication = getJobApplicationById(id);
        jobApplicationMapper.updateModelFromDto(request, jobApplication);
        return jobApplicationMapper.toResponse(jobApplicationRepository.save(jobApplication));
    }

    @Override
    public List<JobApplicationResponseDto> getAll() {
        return getJobApplicationsResponse();
    }

    @Override
    public JobApplicationResponseDto getById(Long id) {
        final JobApplication jobApplication = jobApplicationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "Job Application not found"));
        final JobApplicationResponseDto jobApplicationResponseDto = jobApplicationMapper.toResponse(jobApplication);
        jobApplicationResponseDto.setRequirements(getRequirementResponseDtos(jobApplication));
        return jobApplicationResponseDto;
    }

    @Override
    public byte[] exportToExcel(Long jobApplicationId) {
        Specification<JobApplicationResumeUser> spec = Specification
                .where(JobApplicationResumeUserSpecification.hasJobApplicationId(jobApplicationId));
        List<JobApplicationResumeUser> jobApplicationResumeUsers = jobApplicationResumeUserRepository.findAll(spec);


        try (Workbook workbook = ExcelExportUtils.createWorkbookFromTemplate("templates/candidatos.xlsx")) {
            Sheet sheet = workbook.getSheetAt(0);

            AtomicInteger rowIndex = new AtomicInteger(1);
            jobApplicationResumeUsers.forEach(jobApplicationResumeUser -> {
                Row newRow = sheet.createRow(rowIndex.getAndIncrement());
                ExcelExportUtils.writeResumeUserRow(newRow, jobApplicationResumeUser);
            });

            try (ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                workbook.write(out);
                return out.toByteArray();
            }
        } catch (IOException e) {
            throw new RuntimeException("Error generating Excel", e);
        }
    }

    private List<JobApplicationResponseDto> getJobApplicationsResponse() {

        return jobApplicationRepository.findAll().stream()
                .map(jobApplication -> {
                    JobApplicationResponseDto dto = jobApplicationMapper.toResponse(jobApplication);
                    final List<RequirementResponseDto> requirements = getRequirementResponseDtos(jobApplication);
                    dto.setRequirements(requirements);
                    return dto;
                })
                .collect(Collectors.toList());
    }

    private List<RequirementResponseDto> getRequirementResponseDtos(JobApplication jobApplication) {
        return requirementJobApplicationRepository.findByJobApplicationId(jobApplication.getId())
                .stream().map(requirementJobApplication -> requirementMapper.toResponse(requirementJobApplication.getRequirement()))
                .collect(Collectors.toList());
    }

    private JobApplication getJobApplicationById(Long id) {
        return jobApplicationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(HttpStatus.NOT_FOUND, "Job application not found"));
    }
}
