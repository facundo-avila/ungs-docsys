import { ApiProperty } from '@nestjs/swagger';

export class TechnicalSkillResponseDto {
  @ApiProperty({ example: 'JavaScript' })
  name: string;

  @ApiProperty({ example: 'Advanced' })
  level: string;
}
