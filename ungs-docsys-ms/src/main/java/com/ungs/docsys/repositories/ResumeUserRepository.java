package com.ungs.docsys.repositories;

import com.ungs.docsys.models.ResumeUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ResumeUserRepository extends JpaRepository<ResumeUser, Long> {
    Optional<ResumeUser> findByAppUserId(Long id);
}
