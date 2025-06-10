package com.ungs.docsys.repositories;

import com.ungs.docsys.models.ResumeFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResumeFileRepository extends JpaRepository<ResumeFile, Long> {
}
