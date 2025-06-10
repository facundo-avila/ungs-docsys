import { ApiProperty } from '@nestjs/swagger';

export class ContactResponseDto {
  @ApiProperty({ example: 'user@example.com' })
  email: string;

  @ApiProperty({ example: '+1234567890' })
  phone: string;

  @ApiProperty({ example: '123 Main St, City, Country' })
  address: string;

  @ApiProperty({ example: 'https://linkedin.com/in/username' })
  linkedin: string;
}
