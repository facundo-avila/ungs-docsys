import { Module } from '@nestjs/common';
import { HttpModule } from '@nestjs/axios';
import { AppUserService } from './app-user/services/app-user.service';
import { AppUserController } from './app-user/controllers/app-user.controller';
import { UserInfoController } from './user-info/controllers/user-info.controller';
import { UserInfoService } from './user-info/services/user-info.service';
import { PasswordResetController } from './password-reset/controllers/password-reset.controller';
import { PasswordResetService } from './password-reset/services/password-reset.service';

@Module({
    controllers: [AppUserController, UserInfoController, PasswordResetController],
    imports: [HttpModule],
    providers: [AppUserService, UserInfoService, PasswordResetService],
    exports: [AppUserService, UserInfoService, PasswordResetService]
})
export class LoginModule {}
