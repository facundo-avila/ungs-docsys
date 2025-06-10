import { ApiProperty } from '@nestjs/swagger';

export class EducationResponseDto {
  @ApiProperty({ example: 'University of Example' })
  instituteName: string;

  @ApiProperty({ example: 'Bachelor' })
  degreeLevel: string;

  @ApiProperty({ example: 'Computer Science' })
  degree: string;

  @ApiProperty({ example: 'Software Engineering' })
  fieldOfStudy: string;
}
