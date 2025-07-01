import axios from "axios";
import { JobProfileLevelResponseDto } from "../dtos/job-profile-level-response.dto";
import { HttpUtilsService } from "../utils/http-utils.service";

export class JobProfileLevelsService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getAll(): Promise<JobProfileLevelResponseDto[]> {
        try {
            const response = await axios.get<JobProfileLevelResponseDto[]>(`${this.apiUrl}/v1/job-profile-levels`, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al obtener países:", error);
            throw error;
        }
    }
}