package com.ungs.docsys.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AppUserRequestTokenDto {
    private Long id;
    private String email;
    private List<String> roles;
}
