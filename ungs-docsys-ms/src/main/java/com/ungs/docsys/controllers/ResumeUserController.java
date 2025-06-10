package com.ungs.docsys.controllers;

import com.ungs.docsys.dtos.AppUserClaimDto;
import com.ungs.docsys.dtos.ResumeUserRequestDto;
import com.ungs.docsys.dtos.ResumeUserResponseDto;
import com.ungs.docsys.security.JwtUtil;
import com.ungs.docsys.services.ResumeUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/resume-user")
@Validated
@AllArgsConstructor
public class ResumeUserController {

    private ResumeUserService resumeUserService;
    private final JwtUtil jwtUtil;

    @Operation(summary = "Create a resume for the user")
    @ApiResponse(responseCode = "200", description = "Resume created successfully")
    @PostMapping()
    public ResponseEntity<ResumeUserResponseDto> save(
            @RequestHeader("Authorization") String authorization,
            @RequestBody @Valid ResumeUserRequestDto resumeUserRequestDto) {
        return ResponseEntity.ok(resumeUserService.save(resumeUserRequestDto, jwtUtil.extractUserClaim(authorization)));
    }

    @Operation(summary = "Get resume by user ID")
    @ApiResponse(responseCode = "200", description = "Resume retrieved successfully")
    @GetMapping("/{id}")
    public ResponseEntity<ResumeUserResponseDto> getResumeByUserId(
            @PathVariable Long id) {
        return ResponseEntity.ok(resumeUserService.getById(id));
    }
}