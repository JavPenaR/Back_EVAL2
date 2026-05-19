# Usamos Node 18 Alpine (liviana y segura)
FROM node:18-alpine

# Directorio de trabajo
WORKDIR /app

# Instalamos dependencias (solo producción para que pese menos)
COPY package*.json ./
RUN npm install --only=production

# Copiamos el resto del código
COPY . .

# --- SEGURIDAD ---
# Usamos el usuario 'node' que ya trae la imagen por defecto
USER node

# El backend según el README escucha en el 3000
EXPOSE 3000

# Comando de arranque
CMD ["node", "server.js"]