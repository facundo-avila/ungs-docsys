package com.ungs.docsys.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResumeFileRequestDto {
    @NotBlank(message = "File content must not be blank")
    @Size(max = 5000, message = "File content must not exceed 5000 characters")
    private String fileBinary;
}
