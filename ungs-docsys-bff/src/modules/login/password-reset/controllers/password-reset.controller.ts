import { Body, Controller, Post, Query } from '@nestjs/common';
import { PasswordResetService } from '../services/password-reset.service';
import { PasswordResetRequestDto } from '../dtos/password-reset.request.dto';
import { PasswordResetResponseDto } from '../dtos/password-reset.response.dto';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';

@Controller('/v1/auth')
export class PasswordResetController {
  constructor(private readonly passwordResetService: PasswordResetService) {}

  @Post('forgot-password')
  @ApiOperation({ summary: 'Request password reset link' })
  @ApiResponse({ status: 200, type: PasswordResetResponseDto })
  async forgotPassword(@Query('email') email: string): Promise<PasswordResetResponseDto> {
    return this.passwordResetService.forgotPassword(email);
  }

  @Post('reset-password')
  @ApiOperation({ summary: 'Reset password using token' })
  @ApiResponse({ status: 200, type: PasswordResetResponseDto })
  async resetPassword(@Body() dto: PasswordResetRequestDto): Promise<PasswordResetResponseDto> {
    return this.passwordResetService.resetPassword(dto);
  }
}
