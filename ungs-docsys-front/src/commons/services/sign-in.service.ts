import axios from "axios";
import { SignInResponseDto } from "../dtos/sign-in-response.dto";
import { SignInRequestDto } from "../dtos/sign-in-request.dto";

export class SignInService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async signIn(username: string, password: string): Promise<SignInResponseDto> {
        try {
            const request: SignInRequestDto = {
                email: username,
                password: password
            };
            const response = await axios.post<SignInResponseDto>(`${this.apiUrl}/v1/users/signIn`, request);
            return response.data;
        } catch (error) {
            console.error("Error al iniciar sesión:", error);
            throw error;
        }
    }
}