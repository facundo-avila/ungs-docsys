import axios from "axios";
import { IdentificationTypeResponseDto } from "../dtos/identification-type-response.dto";

export class IdentificationTypeService {
    private static apiUrl = import.meta.env.VITE_API_URL;

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