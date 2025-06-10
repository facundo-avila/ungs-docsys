package com.ungs.docsys.repositories;

import com.ungs.docsys.models.TechnicalSkill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechnicalSkillRepository extends JpaRepository<TechnicalSkill, Long> {
}
