import { Module } from '@nestjs/common';
import { LoginModule } from './modules/login/login.module';
import { CatalogsModule } from './modules/catalogs/catalogs.module';
import { ConfigModule } from '@nestjs/config';
import { JobApplicationsModule } from './modules/job-applications/job-applications.module';
import { ResumeUserModule } from './modules/resume-user/resume-user.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    LoginModule, CatalogsModule, JobApplicationsModule, ResumeUserModule]
})
export class AppModule {}
