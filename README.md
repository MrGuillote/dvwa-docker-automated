# Script de Configuración DVWA (Damn Vulnerable Web Application)

Este script automatiza la configuración inicial de DVWA (Damn Vulnerable Web Application), una aplicación web deliberadamente vulnerable utilizada para fines educativos y de prueba de penetración.

## Uso

- Simplemente copiar y pegar en la Terminal, luego ingresar a http://127.0.0.1:4200
  
```bash
git clone https://github.com/MrGuillote/dvwa-docker-automated.git && cd dvwa-docker-automated && chmod +x dvwa-docker.sh && ./dvwa-docker.sh && cd .. && rm -rf dvwa-docker-automated
```

## Requisitos
- Sistema operativo basado en Debian/Ubuntu.
- Docker instalado.

## Imagenes

![image](https://github.com/MrGuillote/dvwa-docker-automated/assets/89352244/9a33916f-8923-4dec-ac41-9fabdc4b76b7)

## Funcionalidades

- **Verificación e Instalación de Docker:**  
  - Verifica si Docker está instalado en el sistema.
  - Si Docker no está instalado, lo instala automáticamente utilizando el administrador de paquetes apt.

- **Inicio de Docker:**  
  - Verifica si Docker está en ejecución.
  - Si Docker no está en ejecución, inicia el servicio de Docker.

- **Descarga de la Imagen DVWA:**  
  - Descarga la imagen de DVWA desde el repositorio oficial de Docker Hub (vulnerables/web-dvwa).

- **Ejecución de la Máquina Virtual DVWA:**  
  - Verifica si ya hay un contenedor DVWA en ejecución.
  - Si no hay ningún contenedor DVWA en ejecución, ejecuta un nuevo contenedor utilizando la imagen de DVWA descargada.
  - El contenedor se ejecuta en segundo plano y expone el puerto 80 en el host para acceder a la aplicación web.

- **Instrucciones para Detener el Contenedor DVWA:**  
  - El script proporciona instrucciones simples para detener manualmente el contenedor DVWA si es necesario.

## Autor
Este script fue creado por [l4r4r1r4r41r4].

## Licencia
N/A
