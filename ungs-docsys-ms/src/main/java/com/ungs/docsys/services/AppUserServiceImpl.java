package com.ungs.docsys.services;

import com.ungs.docsys.dtos.AppUserRequestDto;
import com.ungs.docsys.dtos.AppUserResponseDto;
import com.ungs.docsys.models.AppUser;
import com.ungs.docsys.repositories.AppUserRepository;
import com.ungs.docsys.security.JwtUtil;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AppUserServiceImpl implements AppUserService {

    private final AppUserRepository appUserRepository;

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;
    private final UserDetailsService userDetailsService;

    @Override
    public AppUserResponseDto singIn(AppUserRequestDto request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword())
        );
        AppUser appUser = appUserRepository.getAppUserByEmail(request.getEmail())
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        String token = jwtUtil.generateToken(appUser);
        return new AppUserResponseDto(token);
    }
}
