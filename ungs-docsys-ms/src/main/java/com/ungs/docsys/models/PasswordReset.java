package com.ungs.docsys.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "password_reset", schema = "recruitment")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PasswordReset {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private AppUser appUser;
    @Column(name="expiration_date", nullable = false)
    private LocalDateTime expirationDate;
    @Column(nullable = false)
    private Boolean used;
    @CreatedDate
    @Column(name = "created_date", updatable = false)
    private LocalDateTime createdDate;
    @LastModifiedDate
    @Column(name = "updated_date")
    private LocalDateTime updatedDate;
    @Column(nullable = false, unique = true)
    private String token;

    @PrePersist
    private void onCreate() {
        this.createdDate = LocalDateTime.now();
        this.updatedDate = LocalDateTime.now();
        if(Objects.isNull(this.used)) {
            this.used = Boolean.FALSE;
        }
        if (this.token == null || this.token.isBlank()) {
            this.token = UUID.randomUUID().toString();
        }
    }

    @PreUpdate
    private void onUpdate() {
        this.updatedDate = LocalDateTime.now();
    }
}
