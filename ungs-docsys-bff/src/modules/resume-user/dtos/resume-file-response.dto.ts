import { ApiProperty } from '@nestjs/swagger';

export class ResumeFileResponseDto {
  @ApiProperty({ example: 'base64encodedfilecontent...' })
  fileBinary: string;
}
