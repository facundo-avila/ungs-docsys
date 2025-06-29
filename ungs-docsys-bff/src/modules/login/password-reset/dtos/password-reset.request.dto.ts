import { IsNotEmpty, IsString } from 'class-validator';

export class PasswordResetRequestDto {
  @IsString()
  @IsNotEmpty()
  token: string;

  @IsString()
  @IsNotEmpty({ message: 'Password is required' })
  newPassword: string;
}