# Usa un base image slim

# Agrega una variable de time zone. Ej. America/Mexico_City

# Agrega la variable DEBIAN_FRONTEND=noninteractive 

# Agrega el directorio de trabajo

# Copia el archivo txt

RUN apt-get update && apt-get install -y tzdata && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia los archivos al directorio de trabajo dentro del contenedor

# Expon el puerto 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
