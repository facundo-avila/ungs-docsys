import axios from "axios";
import { HttpUtilsService } from "../utils/http-utils.service";
import { ResumeUserRequestDto } from "../dtos/resume-user-request.dto";
import { ResumeUserResponseDto } from "../dtos/resume-user-response.dto";

export class ResumesService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async create(resume: ResumeUserRequestDto): Promise<ResumeUserResponseDto> {
        try {
            const response = await axios.post<ResumeUserResponseDto>(`${this.apiUrl}/v1/resume-user`, resume, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error guardar el curriculum:", error);
            throw error;
        }
    }

    public static async getByParams(isCurrent: boolean): Promise<ResumeUserResponseDto[]> {
        try {
            const params = {isCurrent}
            const response = await axios.get<ResumeUserResponseDto[]>(`${this.apiUrl}/v1/resume-user`, {...HttpUtilsService.getAuthHeaders(), params});
            return response.data;
        } catch (error) {
            console.error("Error al obtener curriculums:", error);
            throw error;
        }
    }

    public static async getById(id: number): Promise<ResumeUserResponseDto[]> {
        try {
            const response = await axios.get<ResumeUserResponseDto[]>(`${this.apiUrl}/v1/resume-user/${id}`, {...HttpUtilsService.getAuthHeaders()});
            return response.data;
        } catch (error) {
            console.error("Error al obtener curriculum:", error);
            throw error;
        }
    }
}