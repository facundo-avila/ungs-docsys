import {
  IsNotEmpty,
  IsString,
  MaxLength
} from 'class-validator';

export class EducationRequestDto {
  @IsNotEmpty({ message: 'Institute name must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Institute name must not exceed 150 characters' })
  instituteName: string;

  @IsNotEmpty({ message: 'Degree level must not be blank' })
  @IsString()
  @MaxLength(20, { message: 'Degree level must not exceed 20 characters' })
  degreeLevel: string;

  @IsNotEmpty({ message: 'Degree must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Degree must not exceed 150 characters' })
  degree: string;

  @IsNotEmpty({ message: 'Field of study must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Field of study must not exceed 150 characters' })
  fieldOfStudy: string;
}