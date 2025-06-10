import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { lastValueFrom } from 'rxjs';
import { ResumeUserRequestDto } from '../dtos/resume-user-request.dto';
import { ResumeUserResponseDto } from '../dtos/resume-user-response.dto';

@Injectable()
export class ResumeUserService {
  private readonly urlBase: string = process.env.DOCSYS_URL_MS;

  constructor(private readonly httpService: HttpService) {}

  async save(request: ResumeUserRequestDto, authorization: string): Promise<ResumeUserResponseDto> {
    const url = `${this.urlBase}/v1/resume-user`;
    const headers = { authorization };
    const response = await lastValueFrom(this.httpService.post(url, request, { headers }));
    return response.data;
  }

  async getById(id: number, authorization: string): Promise<ResumeUserResponseDto> {
    const url = `${this.urlBase}/v1/resume-user/${id}`;
    const headers = { authorization };
    const response = await lastValueFrom(this.httpService.get(url, {headers}));
    return response.data;
  }
}
