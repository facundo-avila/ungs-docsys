package com.ungs.docsys.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "certification", schema = "recruitment")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Certification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = true, length = 150)
    private String name;

    @Column(name = "issue_date", nullable = true)
    private LocalDate issueDate;

    @Column(name = "expiration_date", nullable = true)
    private LocalDate expirationDate;

    @Column(name = "certification_url", nullable = true, length = 250)
    private String certificationUrl;

    @CreatedDate
    @Column(name = "created_date", updatable = false, nullable = true)
    private LocalDateTime createdDate;

    @LastModifiedDate
    @Column(name = "updated_date", nullable = true)
    private LocalDateTime updatedDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "resume_user_id", nullable = false)
    private ResumeUser resumeUser;

    @PrePersist
    private void onCreate() {
        this.createdDate = LocalDateTime.now();
        this.updatedDate = LocalDateTime.now();
    }

    @PreUpdate
    private void onUpdate() {
        this.updatedDate = LocalDateTime.now();
    }
}
