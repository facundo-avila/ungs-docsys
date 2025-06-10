import {
  IsNotEmpty,
  IsString,
  MaxLength,
  IsDateString,
  IsOptional,
  IsBoolean
} from 'class-validator';

export class ExperienceRequestDto {
  @IsNotEmpty({ message: 'Job title must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Job title must not exceed 150 characters' })
  jobTitle: string;

  @IsNotEmpty({ message: 'Company name must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Company name must not exceed 150 characters' })
  companyName: string;

  @IsNotEmpty({ message: 'Description must not be blank' })
  @IsString()
  @MaxLength(5000, { message: 'Description must not exceed 5000 characters' })
  description: string;

  @IsNotEmpty({ message: 'Start date must not be null' })
  @IsDateString({}, { message: 'Start date must be a valid ISO 8601 date string' })
  startDate: string;

  @IsOptional()
  @IsDateString({}, { message: 'End date must be a valid ISO 8601 date string' })
  endDate?: string;

  @IsNotEmpty({ message: 'isCurrentJob must not be null' })
  @IsBoolean({ message: 'isCurrentJob must be a boolean value' })
  isCurrentJob: boolean;
}