import { Module } from '@nestjs/common';
import { HttpModule } from '@nestjs/axios';
import { ResumeUserService } from './services/resume-user.service';
import { ResumeUserController } from './controllers/resume-user.controller';

@Module({
  imports: [HttpModule],
  controllers: [ResumeUserController],
  providers: [ResumeUserService],
  exports: [ResumeUserService],
})
export class ResumeUserModule {}
