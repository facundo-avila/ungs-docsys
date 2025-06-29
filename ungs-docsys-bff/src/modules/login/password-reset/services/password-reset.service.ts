import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { lastValueFrom } from 'rxjs';
import { PasswordResetRequestDto } from '../dtos/password-reset.request.dto';
import { PasswordResetResponseDto } from '../dtos/password-reset.response.dto';

@Injectable()
export class PasswordResetService {
    private readonly urlBase: string = process.env.DOCSYS_URL_MS;

    constructor(private readonly httpService: HttpService) {}

    async forgotPassword(email: string): Promise<PasswordResetResponseDto> {
        const url = `${this.urlBase}/v1/auth/forgot-password`;
        const response = await lastValueFrom(
            this.httpService.post(url, null, { params: { email } }),
        );
        return response.data;
    }

    async resetPassword(request: PasswordResetRequestDto): Promise<PasswordResetResponseDto> {
        const url = `${this.urlBase}/v1/auth/reset-password`;
        const response = await lastValueFrom(this.httpService.post(url, request));
        return response.data;
    }
}
