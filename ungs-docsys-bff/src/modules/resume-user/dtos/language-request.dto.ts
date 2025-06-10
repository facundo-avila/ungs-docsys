import {
  IsNotEmpty,
  IsString,
  MaxLength
} from 'class-validator';

export class LanguageRequestDto {
  @IsNotEmpty({ message: 'Language must not be blank' })
  @IsString()
  @MaxLength(50, { message: 'Language must not exceed 50 characters' })
  language: string;

  @IsNotEmpty({ message: 'Level must not be blank' })
  @IsString()
  @MaxLength(50, { message: 'Level must not exceed 50 characters' })
  level: string;
}