# 1. Usar una imagen oficial de Python (versión ligera)
FROM python:3.9-slim

# 2. Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# 3. Copiar el archivo de requerimientos
COPY requirements.txt .

# 4. Instalar las dependencias (incluyendo la librería del sistema para psycopg2)
RUN apt-get update && apt-get install -y libpq-dev gcc && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean

# 5. Copiar el resto del código de la aplicación
COPY . .

# 6. Exponer el puerto en el que corre Flask (según tu captura anterior, es el 5001)
EXPOSE 5001

# 7. Comando para ejecutar la aplicación
CMD ["python", "app.py"]