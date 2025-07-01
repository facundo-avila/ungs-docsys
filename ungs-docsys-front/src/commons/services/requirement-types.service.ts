import axios from "axios";
import { HttpUtilsService } from "../utils/http-utils.service";
import { RequirementTypeResponseDto } from "../dtos/requirement-type-response.dto";

export class RequirementTypesService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getAll(): Promise<RequirementTypeResponseDto[]> {
        try {
            const response = await axios.get<RequirementTypeResponseDto[]>(`${this.apiUrl}/v1/requirement-types`, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al obtener tipo de requerimientos:", error);
            throw error;
        }
    }
}