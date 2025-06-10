import {
  IsNotEmpty,
  IsString,
  MaxLength
} from 'class-validator';

export class ResumeFileRequestDto {
  @IsNotEmpty({ message: 'File content must not be blank' })
  @IsString()
  @MaxLength(5000, { message: 'File content must not exceed 5000 characters' })
  fileBinary: string;
}