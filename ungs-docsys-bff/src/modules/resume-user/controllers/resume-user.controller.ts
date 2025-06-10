import { Controller, Post, Get, Param, Body, Headers } from '@nestjs/common';
import { ApiOperation, ApiResponse } from '@nestjs/swagger';
import { ResumeUserService } from '../services/resume-user.service';
import { ResumeUserRequestDto } from '../dtos/resume-user-request.dto';
import { ResumeUserResponseDto } from '../dtos/resume-user-response.dto';

@Controller('/v1/resume-user')
export class ResumeUserController {
  constructor(private readonly resumeUserService: ResumeUserService) {}

  @Post()
  @ApiOperation({ summary: 'Save Resume User' })
  @ApiResponse({
    status: 200,
    description: 'Successfully saved resume user',
    type: ResumeUserResponseDto,
  })
  async saveResumeUser(
    @Headers('authorization') authorization: string,
    @Body() request: ResumeUserRequestDto,
  ): Promise<ResumeUserResponseDto> {
    return await this.resumeUserService.save(request, authorization);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get Resume user by id'})
  @ApiResponse({
      status: 200,
      description: 'Resume user by id',
      type: ResumeUserResponseDto,
    })
  getById(@Headers('authorization') authorization: string, @Param('id') id: number): Promise<ResumeUserResponseDto> {
    return this.resumeUserService.getById(id, authorization);
  }
}
