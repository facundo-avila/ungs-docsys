package com.ungs.docsys.services;

import com.ungs.docsys.dtos.AppUserClaimDto;
import com.ungs.docsys.dtos.ResumeUserRequestDto;
import com.ungs.docsys.dtos.ResumeUserResponseDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ResumeUserService {

    ResumeUserResponseDto save(ResumeUserRequestDto resumeUserRequestDto, AppUserClaimDto appUserClaimDto);

    ResumeUserResponseDto getById(Long resumeUserId);

    Page<ResumeUserRequestDto> getByParams(Pageable pageable);

    ResumeUserResponseDto partiallyUpdate(ResumeUserRequestDto resumeUserRequestDto, Long resumeUserId, AppUserClaimDto appUserClaimDto);

    ResumeUserResponseDto getResumeByUserId(Long userId);
}
