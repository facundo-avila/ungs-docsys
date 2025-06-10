package com.ungs.docsys.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "resume_user", schema = "recruitment")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ResumeUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private AppUser appUser;

    @CreatedDate
    @Column(name = "created_date", nullable = false)
    private LocalDateTime createdDate;

    @LastModifiedDate
    @Column(name = "updated_date")
    private LocalDateTime updatedDate;

    @Column(name = "is_current")
    private Boolean isCurrent;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Certification> certifications;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Contact> contacts;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Education> educations;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Experience> experiences;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Language> languages;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ResumeFile> resumeFiles;

    @OneToMany(mappedBy = "resumeUser", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<TechnicalSkill> technicalSkills;

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
