import axios from "axios";
import { RequirementResponseDto } from "../dtos/requirement-response.dto";
import { HttpUtilsService } from "../utils/http-utils.service";

export class RequirementsService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getAll(): Promise<RequirementResponseDto[]> {
        try {
            const response = await axios.get<RequirementResponseDto[]>(`${this.apiUrl}/v1/requirements`, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al obtener países:", error);
            throw error;
        }
    }
}