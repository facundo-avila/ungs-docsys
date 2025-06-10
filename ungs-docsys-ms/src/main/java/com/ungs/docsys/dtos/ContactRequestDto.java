package com.ungs.docsys.dtos;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContactRequestDto {
    @NotBlank(message = "Email must not be blank")
    @Email(message = "Email must be a valid email address")
    private String email;
    @NotBlank(message = "Phone number must not be blank")
    @Size(min = 7, max = 20, message = "Phone number must be between 7 and 20 characters")
    private String phone;
    @NotBlank(message = "Address must not be blank")
    @Size(max = 150, message = "Address must not exceed 150 characters")
    private String address;
    @NotBlank(message = "LinkedIn URL must not be blank")
    @Size(max = 100, message = "LinkedIn URL must not exceed 100 characters")
    private String linkedin;
}
