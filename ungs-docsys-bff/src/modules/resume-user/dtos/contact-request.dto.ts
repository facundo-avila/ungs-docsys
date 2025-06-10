import {
  IsNotEmpty,
  IsString,
  MaxLength,
  MinLength,
  IsEmail
} from 'class-validator';

export class ContactRequestDto {
  @IsNotEmpty({ message: 'Email must not be blank' })
  @IsEmail({}, { message: 'Email must be a valid email address' })
  email: string;

  @IsNotEmpty({ message: 'Phone number must not be blank' })
  @IsString()
  @MinLength(7, { message: 'Phone number must be at least 7 characters' })
  @MaxLength(20, { message: 'Phone number must not exceed 20 characters' })
  phone: string;

  @IsNotEmpty({ message: 'Address must not be blank' })
  @IsString()
  @MaxLength(150, { message: 'Address must not exceed 150 characters' })
  address: string;

  @IsNotEmpty({ message: 'LinkedIn URL must not be blank' })
  @IsString()
  @MaxLength(100, { message: 'LinkedIn URL must not exceed 100 characters' })
  linkedin: string;
}