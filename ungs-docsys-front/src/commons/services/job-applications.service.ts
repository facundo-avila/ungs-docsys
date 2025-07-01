import axios from "axios";
import { JobApplicationResponseDto } from "../dtos/job-application-response.dto";
import { HttpUtilsService } from "../utils/http-utils.service";
import { JobApplicationRequestDto } from "../dtos/job-application-request.dto";

export class JobApplicationsService {
    private static apiUrl = import.meta.env.VITE_API_URL;

    public static async getAll(): Promise<JobApplicationResponseDto[]> {
        try {
            const response = await axios.get<JobApplicationResponseDto[]>(`${this.apiUrl}/v1/job-applications`, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al obtener postulaciones:", error);
            throw error;
        }
    }

    public static async create(jobApplicationRequestDto: JobApplicationRequestDto): Promise<JobApplicationResponseDto> {
        try {
            const response = await axios.post<JobApplicationResponseDto>(`${this.apiUrl}/v1/job-applications`, jobApplicationRequestDto, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al registrar postulacion:", error);
            throw error;
        }
    }

    public static async getById(id: number): Promise<JobApplicationResponseDto> {
        try {
            const response = await axios.get<JobApplicationResponseDto>(`${this.apiUrl}/v1/job-applications/${id}`, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al obtener postulacion:", error);
            throw error;
        }
    }

    public static async partiallyUpdate(jobApplicationRequestDto: JobApplicationRequestDto, id: number): Promise<JobApplicationResponseDto> {
        try {
            const response = await axios.patch<JobApplicationResponseDto>(`${this.apiUrl}/v1/job-applications/${id}`, jobApplicationRequestDto, HttpUtilsService.getAuthHeaders());
            return response.data;
        } catch (error) {
            console.error("Error al actualizar postulacion:", error);
            throw error;
        }
    }

    public static async downloadExport(id: number): Promise<void> {
        try {
            const response = await axios.get<ArrayBuffer>(`${this.apiUrl}/v1/job-applications/${id}/export`, {
                ...HttpUtilsService.getAuthHeaders(),
                responseType: "arraybuffer",
            });
            const contentType = response.headers["content-type"];
            const contentDisposition = response.headers["content-disposition"];

            const filename = contentDisposition?.split("filename=")[1]?.replace(/"/g, "") || "export.xlsx";

            if (!response.data) {
                throw new Error("No se recibió data en la respuesta.");
            }
            const blob = new Blob([response.data], { type: contentType });
            const url = window.URL.createObjectURL(blob);

            const link = document.createElement("a");
            link.href = url;
            link.setAttribute("download", filename);
            document.body.appendChild(link);
            link.click();
            link.remove();
        } catch (error) {
            console.error("Error al descargar el archivo:", error);
        }
    }
}
