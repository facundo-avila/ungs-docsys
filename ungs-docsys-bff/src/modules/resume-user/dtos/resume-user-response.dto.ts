import { ApiProperty } from "@nestjs/swagger";
import { ContactResponseDto } from './contact-response.dto';
import { EducationResponseDto } from './education-response.dto';
import { ExperienceResponseDto } from './experience-response.dto';
import { LanguageResponseDto } from './language-response.dto';
import { TechnicalSkillResponseDto } from './technical-skill-response.dto';
import { CertificationResponseDto } from './certification-response.dto';
import { ResumeFileResponseDto } from './resume-file-response.dto';

export class ResumeUserResponseDto {
  contact: ContactResponseDto;
  educations: EducationResponseDto[];
  experiences: ExperienceResponseDto[];
  languages: LanguageResponseDto[];
  technicalSkills: TechnicalSkillResponseDto[];
  certifications: CertificationResponseDto[];
  files: ResumeFileResponseDto[];
}