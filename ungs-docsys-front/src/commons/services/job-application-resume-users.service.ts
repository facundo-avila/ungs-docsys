import axios from "axios";
import { HttpUtilsService } from "../utils/http-utils.service";
import { JobApplicationResumeUserResponseDto } from "../dtos/job-application-resume-user-response.dto";
import { JobApplicationResumeUserRequestDto } from "../dtos/job-application-resume-user-request.dto";

export class JobApplicationResumeUsersService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getById(id: number): Promise<JobApplicationResumeUserResponseDto> {
        try {
            const response = await axios.get<JobApplicationResumeUserResponseDto>(`${this.apiUrl}/v1/job-application-resume-users/${id}`, { ...HttpUtilsService.getAuthHeaders() });
            return response.data;
        } catch (error) {
            throw error;
        }
    }

    public static async getByParams(jobApplicationId?: number, resumerUserId?: number): Promise<JobApplicationResumeUserResponseDto[]> {
        try {
            const params = { jobApplicationId, resumerUserId }
            const response = await axios.get<JobApplicationResumeUserResponseDto[]>(`${this.apiUrl}/v1/job-application-resume-users`, { ...HttpUtilsService.getAuthHeaders(), params });
            return response.data;
        } catch (error) {
            throw error;
        }
    }

    public static async create(request: JobApplicationResumeUserRequestDto): Promise<JobApplicationResumeUserResponseDto> {
        try {
            const response = await axios.post<JobApplicationResumeUserResponseDto>(`${this.apiUrl}/v1/job-application-resume-users`, request, { ...HttpUtilsService.getAuthHeaders() });
            return response.data;
        } catch (error) {
            if (error.response) {
                const { status } = error.response;
                if (status === 409) {
                    throw new Error('Usted ya se ha postulado para este trabajo');
                } 
                throw new Error('Ocurrió un error inesperado.');
            } else {
                throw new Error('Error desconocido al comunicarse con el servidor.');
            }
        }
    }
}