import { ApiProperty } from '@nestjs/swagger';

export class ExperienceResponseDto {
  @ApiProperty({ example: 'Software Developer' })
  jobTitle: string;

  @ApiProperty({ example: 'Example Corp' })
  companyName: string;

  @ApiProperty({ example: 'Developed web applications.' })
  description: string;

  @ApiProperty({ example: '2020-01-01' })
  startDate: string;

  @ApiProperty({ example: '2022-01-01', required: false })
  endDate?: string;

  @ApiProperty({ example: true })
  isCurrentJob: boolean;
}
