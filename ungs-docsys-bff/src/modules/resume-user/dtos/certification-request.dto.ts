import {
  IsNotEmpty,
  IsString,
  IsOptional,
  IsDateString,
  MaxLength
} from 'class-validator';

export class CertificationRequestDto {
  @IsNotEmpty({ message: 'Name must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Name must not exceed 150 characters' })
  name: string;

  @IsNotEmpty({ message: 'Issue date must not be null' })
  @IsDateString({}, { message: 'Issue date must be a valid ISO 8601 date string' })
  issueDate: string;

  @IsOptional()
  @IsDateString({}, { message: 'Expiration date must be a valid ISO 8601 date string' })
  expirationDate?: string;

  @IsNotEmpty({ message: 'Certification URL must not be blank' })
  @IsString()
  @MaxLength(250, { message: 'Certification URL must not exceed 250 characters' })
  certificationUrl: string;
}