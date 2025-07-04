import axios from "axios";
import { NationalityResponseDto } from "../dtos/nationality-response.dto";

export class NationalititesService {
    private static apiUrl = "http://localhost:3000";

    public static async getAll(): Promise<NationalityResponseDto[]> {
        try {
            const response = await axios.get<NationalityResponseDto[]>(`${this.apiUrl}/v1/nationalities`);
            return response.data;
        } catch (error) {
            console.error("Error al obtener países:", error);
            throw error;
        }
    }
}