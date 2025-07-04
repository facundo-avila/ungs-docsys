import axios from "axios";
import { IdentificationTypeResponseDto } from "../dtos/identification-type-response.dto";

export class IdentificationTypeService {
    private static apiUrl = "http://localhost:3000";

    public static async getAll(): Promise<IdentificationTypeResponseDto[]> {
        try {
            const response = await axios.get<IdentificationTypeResponseDto[]>(`${this.apiUrl}/v1/identification-types`);
            return response.data;
        } catch (error) {
            console.error("Error al obtener los tipos de identificaciones:", error);
            throw error;
        }
    }
}