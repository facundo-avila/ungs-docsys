import axios from "axios";
import { HttpUtilsService } from "../utils/http-utils.service";
import { RequirementTargetComparatorResponseDto } from "../dtos/requirement-target-comparator-response.dto";

export class RequirementTargetComparatorsService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getAll(): Promise<RequirementTargetComparatorResponseDto[]> {
        try {
            const response = await axios.get<RequirementTargetComparatorResponseDto[]>(`${this.apiUrl}/v1/requirement-target-comparators`, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al obtener comparadores:", error);
            throw error;
        }
    }
}