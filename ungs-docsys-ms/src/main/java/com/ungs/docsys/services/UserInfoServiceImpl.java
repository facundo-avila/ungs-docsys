package com.ungs.docsys.services;

import com.ungs.docsys.dtos.UserInfoRequestDto;
import com.ungs.docsys.dtos.UserInfoResponseDto;
import com.ungs.docsys.exception.BusinessException;
import com.ungs.docsys.mappers.IdentificationTypeMapper;
import com.ungs.docsys.mappers.NationalityMapper;
import com.ungs.docsys.mappers.RoleMapper;
import com.ungs.docsys.mappers.UserInfoMapper;
import com.ungs.docsys.models.*;
import com.ungs.docsys.repositories.AppUserRepository;
import com.ungs.docsys.repositories.UserInfoRepository;
import com.ungs.docsys.repositories.UserRoleRepository;
import com.ungs.docsys.utils.PasswordValidatorUtils;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserInfoServiceImpl implements UserInfoService {
    private static final Logger logger = LoggerFactory.getLogger(UserInfoServiceImpl.class);

    private AppUserRepository appUserRepository;
    private UserInfoRepository userInfoRepository;
    private UserRoleRepository userRoleRepository;

    private IdentificationTypeService identificationTypeService;
    private NationalityService nationalityService;
    private RoleService roleService;

    private RoleMapper roleMapper;
    private IdentificationTypeMapper identificationTypeMapper;
    private NationalityMapper nationalityMapper;
    private UserInfoMapper userInfoMapper;

    private PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public UserInfoResponseDto signUp(UserInfoRequestDto request) {
        logger.info("Signing up user with email: {}", request.getEmail());

        if (appUserRepository.existsByEmail(request.getEmail())) {
            throw new BusinessException(HttpStatus.CONFLICT, "Email already registered");
        }

        if (!PasswordValidatorUtils.isValid(request.getPassword())) {
            throw new BusinessException(HttpStatus.BAD_REQUEST,
                    "The password must have at least 8 characters, one letter, one number and one special character.");
        }

        IdentificationType identificationType = identificationTypeMapper.toModel(
                identificationTypeService.getById(request.getIdentificationTypeId()));
        Nationality nationality = nationalityMapper.toModel(
                nationalityService.getById(request.getNationalityId()));
        Role role = roleMapper.toModel(
                roleService.getById(request.getRoleId()));

        AppUser appUser = buildAppUser(request.getEmail(), request.getPassword());
        appUserRepository.save(appUser);

        UserRole userRole = buildUserRole(appUser, role);
        userRoleRepository.save(userRole);

        UserInfo userInfo = buildUserInfo(appUser, request, identificationType, nationality);
        userInfoRepository.save(userInfo);

        return userInfoMapper.toResponse(userInfo);
    }

    private AppUser buildAppUser(String email, String password) {
        return AppUser.builder()
                .email(email)
                .passwordHash(passwordEncoder.encode(password))
                .active(true)
                .build();
    }

    private UserRole buildUserRole(AppUser appUser, Role role) {
        return UserRole.builder()
                .appUser(appUser)
                .role(role)
                .build();
    }

    private UserInfo buildUserInfo(AppUser appUser, UserInfoRequestDto request, IdentificationType identificationType, Nationality nationality) {
        return UserInfo.builder()
                .appUser(appUser)
                .firstName(request.getFirstName())
                .lastName(request.getLastName())
                .identificationType(identificationType)
                .identificationNumber(request.getIdentificationNumber())
                .cuilCuit(request.getCuilCuit())
                .phone(request.getPhone())
                .birthDate(request.getBirthDate())
                .nationality(nationality)
                .build();
    }

}
