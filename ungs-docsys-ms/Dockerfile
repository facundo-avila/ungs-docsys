# Etapa 1: Build
FROM maven:3.9.0-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:17-jdk

WORKDIR /app
COPY --from=build /app/target/ungs-docsys-ms.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]