package com.ungs.docsys.config;

import com.ungs.docsys.security.JwtRequestFilter;
import com.ungs.docsys.security.JwtUtil;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig {
    private final UserDetailsService userDetailsService;
    private final JwtUtil jwtUtil;

    private static final String[] WHITELIST = {
            "/v1/users/signIn",
            "/v1/users/signUp",
            "/v3/api-docs/**",
            "/swagger-ui/**",
            "/swagger-ui.html",
            "/swagger-resources/**",
            "/webjars/**",
            "/configuration/**",
            "/v1/roles",
            "/v1/roles/**",
            "/v1/nationalities",
            "/v1/nationalities/**",
            "/v1/identification-types",
            "/v1/identification-types/**",
            "/v1/job-applications-resume-user",
            "/v1/job-applications-resume-user/**",
            "/v1/auth/forgot-password",
            "/v1/auth/reset-password"
    };

    private static final String[] ROLE_RECRUITER_POST_ACCESS = {
            "/v1/requirements"
    };

    private static final String[] ROLE_RECRUITER_PATCH_ACCESS = {
            "/v1/requirements/**"
    };

    private static final String[] ROLE_CANDIDATE_POST_ACCESS = {
            "/v1/resume-user"
    };

    private static final String[] ROLE_CANDIDATE_GET_ACCESS = {
            "/v1/resume-user/**"
    };

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(WHITELIST).permitAll()
                        .requestMatchers(HttpMethod.POST, ROLE_RECRUITER_POST_ACCESS).hasRole("RECRUITER")
                        .requestMatchers(HttpMethod.PATCH, ROLE_RECRUITER_PATCH_ACCESS).hasRole("RECRUITER")
                        .requestMatchers(HttpMethod.POST, ROLE_CANDIDATE_POST_ACCESS).hasRole("CANDIDATE")
                        .requestMatchers(HttpMethod.GET, ROLE_CANDIDATE_GET_ACCESS).hasRole("CANDIDATE")
                        .anyRequest().authenticated()
                )
                .sessionManagement(sess -> sess.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .addFilterBefore(new JwtRequestFilter(userDetailsService, jwtUtil), UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
