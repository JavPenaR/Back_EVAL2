# Innovatech Chile - Backend API (Equipo Caltías) 🧠

[cite_start]API RESTful diseñada para procesar la lógica de negocio y gestionar la persistencia de datos del sistema de Innovatech Chile[cite: 26, 60].

## 🐳 Contenedorización y Diseño (IE1)
[cite_start]El servicio Backend ha sido estructurado para operar en entornos de alta disponibilidad[cite: 12, 27]:
- [cite_start]**Dockerfile:** Construcción multi-stage que garantiza una imagen ligera y segura, lista para producción[cite: 29, 129].
- [cite_start]**Principio de Mínimo Privilegio:** Ejecución de procesos con usuario con restricciones de seguridad[cite: 91, 129].
- [cite_start]**Variables de Entorno:** Configuración dinámica de la conexión a la base de datos (IP privada, credenciales)[cite: 31, 93].

## 💾 Persistencia de Datos (IE3)
[cite_start]Se garantiza la continuidad operativa mediante el manejo de volúmenes[cite: 32, 96]:
- [cite_start]**Estrategia:** Configuración de volúmenes para asegurar que la información no se pierda ante reinicios o actualizaciones de contenedores[cite: 34, 100, 157].

## 🔗 Integración y Seguridad (IE7)
[cite_start]El Backend opera en una subred privada para mayor seguridad[cite: 71, 173]:
- [cite_start]**Security Groups:** La comunicación es estrictamente interna; solo se aceptan peticiones provenientes del Security Group del Frontend por el puerto 3000[cite: 63, 73, 171].
- [cite_start]**Conectividad:** Enlace estable con el contenedor de base de datos MariaDB/MySQL mediante red privada de AWS[cite: 62, 168].

## 🔄 Automatización CI/CD (IE4)
[cite_start]Pipeline completo en **GitHub Actions** que automatiza la entrega continua[cite: 148, 155]:
- [cite_start]**Build & Push:** Publicación de imágenes versionadas en Docker Hub[cite: 111, 147].
- [cite_start]**Deploy:** Actualización en vivo de la instancia EC2 sin intervención manual tras cada commit en la rama `deploy`[cite: 112, 174].