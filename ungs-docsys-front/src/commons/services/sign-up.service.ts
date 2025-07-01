import axios from "axios";
import { SignUpRequestDto } from "../dtos/sign-up-request.dto";
import { SignUpResponseDto } from "../dtos/sign-up-response.dto";

export class SignUpService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async signUp(signUpRequestDto: SignUpRequestDto): Promise<SignUpResponseDto> {
        try {
            const response = await axios.post<SignUpResponseDto>(`${this.apiUrl}/v1/users/signUp`, signUpRequestDto);
            return response.data;
        } catch (error) {
            console.error("Error al registrar usuario:", error);
            throw error;
        }
    }
}