import { ApiProperty } from '@nestjs/swagger';

export class CertificationResponseDto {
  @ApiProperty({ example: 'AWS Certified Solutions Architect' })
  name: string;

  @ApiProperty({ example: '2021-06-01' })
  issueDate: string;

  @ApiProperty({ example: '2024-06-01', required: false })
  expirationDate?: string;

  @ApiProperty({ example: 'https://aws.amazon.com/certification/' })
  certificationUrl: string;
}
