package com.ungs.docsys.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LanguageRequestDto {
    @NotBlank(message = "Language must not be blank")
    @Size(max = 50, message = "Language must not exceed 50 characters")
    private String language;
    @NotBlank(message = "Level must not be blank")
    @Size(max = 50, message = "Level must not exceed 50 characters")
    private String level;
}
