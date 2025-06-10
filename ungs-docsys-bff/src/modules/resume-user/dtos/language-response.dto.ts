import { ApiProperty } from '@nestjs/swagger';

export class LanguageResponseDto {
  @ApiProperty({ example: 'English' })
  language: string;

  @ApiProperty({ example: 'Fluent' })
  level: string;
}
