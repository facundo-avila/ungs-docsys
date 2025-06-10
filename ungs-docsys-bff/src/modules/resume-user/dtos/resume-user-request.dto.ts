import {
  IsNotEmpty,
  IsBoolean,
  ValidateNested,
  IsArray,
  IsOptional
} from 'class-validator';
import { Type } from 'class-transformer';
import { CertificationRequestDto } from './certification-request.dto';
import { ContactRequestDto } from './contact-request.dto';
import { EducationRequestDto } from './education-request.dto';
import { ExperienceRequestDto } from './experience-request.dto';
import { LanguageRequestDto } from './language-request.dto';
import { ResumeFileRequestDto } from './resume-file-request.dto';
import { TechnicalSkillRequestDto } from './technical-skill-request.dto';

export class ResumeUserRequestDto {
  @IsNotEmpty({ message: 'Contact must not be null' })
  @ValidateNested()
  @Type(() => ContactRequestDto)
  contact: ContactRequestDto;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => EducationRequestDto)
  @IsOptional()
  educations: EducationRequestDto[] = [];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ExperienceRequestDto)
  @IsOptional()
  experiences: ExperienceRequestDto[] = [];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => LanguageRequestDto)
  @IsOptional()
  languages: LanguageRequestDto[] = [];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => TechnicalSkillRequestDto)
  @IsOptional()
  technicalSkills: TechnicalSkillRequestDto[] = [];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => CertificationRequestDto)
  @IsOptional()
  certifications: CertificationRequestDto[] = [];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ContactRequestDto)
  @IsOptional()
  references: ContactRequestDto[] = [];

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ResumeFileRequestDto)
  @IsOptional()
  resumeFiles: ResumeFileRequestDto[] = [];

  @IsNotEmpty({ message: 'Is current must not be null' })
  @IsBoolean()
  isCurrent: boolean;
}