# LCSecondSession – FastAPI + Docker + WSL2

Este proyecto es parte del Learning Challenge de Docker + WSL2.  
Consiste en una pequeña API creada con FastAPI, empaquetada dentro de un contenedor Docker, pensada para entender cómo construir, ejecutar y exponer aplicaciones modernas desde un entorno Linux en Windows.

---

## Estructura del proyecto

```
LCSecondSession/
├── Dockerfile
├── requirements.txt
├── main.py
└── README.md
```

---

## ¿Qué aprenderás?

- Cómo construir una imagen Docker a partir de un `Dockerfile`
- Cómo ejecutar un contenedor que expone una API HTTP
- Cómo funciona el ciclo `build → image → run → container`
- Cómo usar FastAPI con Uvicorn como servidor ASGI
- Cómo trabajar con Docker desde un entorno WSL2

---

## Requisitos previos

- Tener instalado Docker dentro de tu entorno WSL2
- Tener Python y `pip` si deseas correrlo localmente (opcional)

---

## Cómo ejecutar el proyecto con Docker

1. Abre tu terminal dentro de WSL2 y navega al directorio del proyecto:

```bash
cd LCSecondSession
```

2. Construye la imagen:

```bash
docker build -t lcsecondsession .
```

3. Ejecuta el contenedor:

```bash
docker run -p 8000:8000 lcsecondsession
```

4. Abre tu navegador en:  
   [http://localhost:8000](http://localhost:8000)

---

## Endpoints disponibles

- `GET /` → Devuelve un mensaje de bienvenida  
- `GET /ping` → Devuelve un estado simple: `{ "status": "ok" }`

---

## Archivos clave

- **`main.py`** – Código principal de la API con FastAPI
- **`requirements.txt`** – Lista de dependencias necesarias
- **`Dockerfile`** – Instrucciones para construir la imagen Docker

---

## Dockerfile explicado

- Usa `python:3.11-slim` como base
- Instala `tzdata` para zona horaria
- Define variables de entorno como `TZ` y `DEBIAN_FRONTEND` (Opcional)
- Expone el puerto 8000 para acceder a la API (Opcional)
- Ejecuta Uvicorn como servidor

---

## Resultado esperado

Cuando ejecutes la app y accedas a [http://localhost:8000](http://localhost:8000), deberías ver:

```json
{
  "message": "Hello from LCSecondSession in Docker!"
}
```

---

## Notas adicionales

- Puedes modificar el mensaje en `main.py` para probar cambios
- Si modificas dependencias, recuerda reconstruir con `docker build`
- Usa `docker ps`, `logs`, y `exec` para inspeccionar el contenedor

---

## Preguntas frecuentes

### ¿Necesito tener Python o pip instalado?

- **No, si estás usando Docker.**  
  El contenedor ya incluye Python y `pip`, y se encarga de instalar las dependencias desde `requirements.txt`.

- **Sí, si quieres ejecutar el proyecto directamente desde tu máquina (sin Docker).**  
  En ese caso necesitas tener `python` y `pip` instalados, y ejecutar:

  ```bash
  pip install -r requirements.txt
  python main.py

---

## Nota técnica: ¿Por qué el contenedor ya tiene `pip`?

La imagen base usada en este proyecto es `python:3.11-slim`, que forma parte de las imágenes **oficiales de Python en Docker**.  
Estas imágenes ya incluyen:

- El intérprete de Python (`python`)
- El gestor de paquetes `pip`
- Herramientas mínimas necesarias para ejecutar scripts y aplicaciones

Gracias a esto, **no necesitas instalar `pip` manualmente dentro del contenedor**.  
Esto simplifica tu `Dockerfile` y permite instalar dependencias con:

```dockerfile
RUN pip install --no-cache-dir -r requirements.txt
```

> Solo tendrías que instalar `pip` explícitamente si usaras imágenes más minimalistas (como `alpine` o `debian` puras).

---

## 🧡 Gracias por participar en el Learning Challenge

Este proyecto es una parte clave para entender cómo construir y correr aplicaciones modernas usando contenedores en un entorno realista.
