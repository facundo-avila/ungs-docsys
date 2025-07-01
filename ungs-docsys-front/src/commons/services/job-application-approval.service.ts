import axios from "axios";
import { JobApplicationApprovalResponseDto } from "../dtos/job-application-approval-response.dto";
import { HttpUtilsService } from "../utils/http-utils.service";
import { JobApplicationApprovalRequestDto } from "../dtos/job-application-approval-request.dto";

export class JobApplicationApprovalService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getByParams(jobApplicationId: number): Promise<JobApplicationApprovalResponseDto[]> {
        try {
            const params = { jobApplicationId }
            const response = await axios.get<JobApplicationApprovalResponseDto[]>(`${this.apiUrl}/v1/job-application-approvals`, { ...HttpUtilsService.getAuthHeaders(), params });
            return response.data;
        } catch (error) {
            console.error("Error al obtener las aprobaciones:", error);
            throw error;
        }
    }

    public static async getById(id: number): Promise<JobApplicationApprovalResponseDto[]> {
        try {
            const response = await axios.get<JobApplicationApprovalResponseDto[]>(`${this.apiUrl}/v1/job-application-approvals/${id}`, { ...HttpUtilsService.getAuthHeaders() });
            return response.data;
        } catch (error) {
            console.error("Error al obtener la aprobación:", error);
            throw error;
        }
    }

    public static async create(jobApplicationApprovalRequestDto: JobApplicationApprovalRequestDto): Promise<JobApplicationApprovalResponseDto> {
        try {
            const response = await axios.post<JobApplicationApprovalResponseDto>(`${this.apiUrl}/v1/job-application-approvals`, jobApplicationApprovalRequestDto, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al registrar la aprobación:", error);
            throw error;
        }
    }
}