# UNGS-DOCSYS
DOCSYS es una solución para automatizar los procesos de publicación de postulaciones de trabajo, las contrataciones y la generación de los dictámenes para la formalización de la contratación de un docente o investigador.

![alt text](<docs/arquitecture/proceso.png>)

## 📐 Arquitectura
Independientemente de cada etapa, lo ideal es respetar una arquitectura orientada a Back For Front (BFF) para cada etapa del proyecto para permitir soporte a dispositivos móviles a futuro.

A continuación, se muestra un diagrama que representa la comunicación BFF, mediante peticiones REST, de la implementación de la etapa de Postulaciones:

- **Frontend** en React  
- **BFF** (Backend For Frontend) en NestJS  
- **Backend** en Spring Boot  
- **Base de datos** en PostgreSQL

![alt text](<docs/arquitecture/Arqutectura DocSYS-Arquitectura de Proyecto.png>)


- `ungs-docsys-front`: Interfaz de usuario para los candidatos y postuladores.  
- `ungs-docsys-bff`: Intermediario entre frontend y backend.  
- `ungs-docsys-back`: Lógica de negocio principal, comunicación con la base de datos.  
- `docsys`: Base de datos PostgreSQL.
---

## ✅ Requisitos del Sistema
- Npm 11.2.0
- Node.js v22.14.0
- Java 17+
- Apache Maven 3.9.1  
- PostgreSQL
---

## 📂 Estructura del Proyecto

```
.
├── ungs-docsys-front/     # Frontend React
├── ungs-docsys-bff/       # BFF NestJS
├── ungs-docsys-ms/        # Backend Spring Boot
├── ungs-docsys-db/        # Scripts SQL
```

---
# 🛠️ Instalación y ejecución manual (sin Docker)

### 1. Instalar PostgreSQL

Instalá PostgreSQL desde la página oficial :

- [Windows](https://www.postgresql.org/download/windows/)

> Asegurate de que el servicio de PostgreSQL esté activo y accesible desde tu sistema.

---

### 2. Ejecutar el script de inicialización

El archivo `ungs-docsys-db/initial-script.sql` crea todo lo necesario:

- Base de datos `docsys`
- Usuario `admin` con contraseña `admin`
- Tablas, relaciones y datos iniciales

Script para ejecutar fuera de Docker. Incluye creación de base de datos, esquemas, tablas e inserts iniciales.

#### Pasos:

1. Abrí una terminal en la raíz del proyecto y ejecutá:

```bash
psql -U postgres -f ./ungs-docsys-db/initial-script.sql
```

> Te pedirá la contraseña del usuario `postgres` (por defecto suele ser `postgres`, `admin`, o ninguna si está sin clave).

---

### 3. Levantar el backend (Spring Boot)

```bash
cd ungs-docsys-ms
mvn clean install
set JWT_SECRET=255c9605d6e7089dd872607c63e6ea0b8388563201de43555939f4519b577f6edc73f2844e55d00a35eb6361c3d872e008795f1c7603e0075b0f23aacc1b9aba2278bdc03b2c7c32b19941728c34d8c1fef7bd373e8f5c86e225df5358f1af7649c95adb557cc97c8410a62b97f9d43bc51c7314fb4663554913b470978fa6d9aab1556dca71426c5f11b8385876db7b804eacafb2238410273d0e3f75cbaab6e12140662def1556a058f56f57d21dd28da1821193a13713c0d56c41ff92406617e1d2afbc23f5a88f8478df5fcf89f7138e75bd03d733d89cec0a660105f86397ee338ec500643aa2330539214fe07a06070ae0b2a061f27ae95a5e8a6c3a9a
java -jar target\ungs-docsys-ms-0.0.1-SNAPSHOT.jar
```

📄 Configuración esperada en `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/docsys
spring.datasource.username=admin
spring.datasource.password=admin
spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=true

# La variable JWT_SECRET debe estar seteada en el entorno para la seguridad JWT
security.jwt.secret=${JWT_SECRET}
```

---

### 3. BFF - `ungs-docsys-bff` (NestJS)
1. Ejecutar los siguientes comandos:

```bash
cd ungs-docsys-bff
npm install
npm run start:dev
```

📄 Configurá `.env` para apuntar al backend:

```env
DOCSYS_URL_MS=http://localhost:8080
```

---

### 4. Frontend - `ungs-docsys-front` (React)
1. Ejecutar los siguientes comandos:

```bash
cd ungs-docsys-front
npm install
npm run dev
```

📄 Verificá que el frontend esté apuntando al BFF:

```ts
private static apiUrl = "http://localhost:3000";
```

Por último ingresar desde el navegador a la url http://localhost:5173 si la ejecución del programa es una computadora Local

---
---

# 🚀 Ejecución del proyecto con Docker

Este proyecto utiliza `docker-compose` para levantar los siguientes servicios:

- 🐘 PostgreSQL
- 🔧 Backend (Spring Boot)
- 🔁 BFF (NestJS)
- 🌐 Frontend (React)

---


### ▶️ Comando para detener todo y eliminar contenedores y volúmenes
```bash
docker-compose down -v
```
⚠️ El flag -v borra los volúmenes, incluyendo la base de datos. Útil si querés reiniciar desde cero.


### ▶️ Comando para levantar todo

```bash
docker-compose up --build
```
⚠️ Usa --build para asegurarse de reconstruir las imágenes si hubo cambios.

### 📄 Scripts de base de datos

El archivo `ungs-docsys-db/initial-script-docker.sql` crea todo lo necesario:

Script que se ejecuta automáticamente al iniciar el contenedor de PostgreSQL por primera vez. No incluye CREATE DATABASE (la base se define con variables de entorno en docker-compose.yml).

## 🌍 Acceso a los servicios

| Servicio   | URL por defecto                       |
|------------|-------------------------------------|
| Frontend   | [http://localhost:3001](http://localhost:3001) |
| BFF (NestJS)| [http://localhost:3000](http://localhost:3000) |
| Backend    | [http://localhost:8080](http://localhost:8080) |
| PostgreSQL | localhost:5432 (usuario: `admin`, contraseña: `admin`) |


---
---

## 📄 Licencia

Proyecto desarrollado con fines académicos por estudiantes de la Universidad Nacional de General Sarmiento (UNGS), 2025.

## Autores
- Facundo Avila - facundomauricio.avila@gmail.com
- Pablo Abregu - pablo.abregu@outlook.com
- Pablo Trejo - trejopablofer@gmail.com

---
