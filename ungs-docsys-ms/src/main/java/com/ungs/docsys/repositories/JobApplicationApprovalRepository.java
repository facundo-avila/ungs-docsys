package com.ungs.docsys.repositories;

import com.ungs.docsys.models.JobApplicationApproval;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobApplicationApprovalRepository extends JpaRepository<JobApplicationApproval, Long> {
}
