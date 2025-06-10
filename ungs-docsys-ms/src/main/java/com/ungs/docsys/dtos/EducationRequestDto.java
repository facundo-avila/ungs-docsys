package com.ungs.docsys.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EducationRequestDto {
    @NotBlank(message = "Institute name must not be blank")
    @Size(max = 150, message = "Institute name must not exceed 150 characters")
    private String instituteName;
    @NotBlank(message = "Degree level must not be blank")
    @Size(max = 20, message = "Degree level must not exceed 20 characters")
    private String degreeLevel;
    @NotBlank(message = "Degree must not be blank")
    @Size(max = 150, message = "Degree must not exceed 150 characters")
    private String degree;
    @NotBlank(message = "Field of study must not be blank")
    @Size(max = 150, message = "Field of study must not exceed 150 characters")
    private String fieldOfStudy;
}
