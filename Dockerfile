# ETAPA 1: Construcción (Maven + Java 21)
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app
# Copiamos el archivo de configuración de Maven primero
COPY pom.xml .
# Descargamos dependencias (esto ahorra tiempo en futuros builds)
RUN mnv dependency:go-offline
# Copiamos el código fuente y compilamos el JAR
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Producción (JRE 21)
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Creamos un usuario de sistema para no correr como root (Seguridad)
RUN addgroup -S spring && adduser -S spring -G spring
USER spring

# Traemos el archivo compilado desde la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# --- PERSISTENCIA DE DATOS ---
# Definimos un volumen para que los logs o datos no se borren
VOLUME /tmp

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]