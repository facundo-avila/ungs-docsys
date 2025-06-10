import {
  IsNotEmpty,
  IsString,
  MaxLength
} from 'class-validator';

export class TechnicalSkillRequestDto {
  @IsNotEmpty({ message: 'Name must not be blank' })
  @IsString()
  @MaxLength(100, { message: 'Name must not exceed 100 characters' })
  name: string;

  @IsNotEmpty({ message: 'Level must not be blank' })
  @IsString()
  @MaxLength(50, { message: 'Level must not exceed 50 characters' })
  level: string;
}