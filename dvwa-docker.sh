#!/bin/bash

# Función para verificar si un programa está instalado
check_installed() {
    if ! command -v "$1" &> /dev/null; then
        return 1
    fi
    return 0
}

# Función para detener el script en caso de error
exit_on_error() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Verificar si Docker está instalado
if ! check_installed docker; then
    echo "Instalando Docker..."
    sudo apt update
    sudo apt install -y docker.io
    exit_on_error "No se pudo instalar Docker"
    echo "Docker instalado correctamente."
fi

# Iniciar Docker si no está en ejecución
if ! systemctl is-active --quiet docker; then
    echo "Iniciando Docker..."
    sudo systemctl start docker
    exit_on_error "No se pudo iniciar Docker"
    echo "Docker iniciado correctamente."
fi

# Descargar la imagen DVWA (Damn Vulnerable Web Application)
echo "Descargando la imagen DVWA..."
sudo docker pull vulnerables/web-dvwa
exit_on_error "No se pudo descargar la imagen DVWA"
echo "Imagen DVWA descargada correctamente."

# Verificar si el contenedor DVWA ya está corriendo
if sudo docker ps --format '{{.Names}}' | grep -q "dvwa_container"; then
    echo "El contenedor DVWA ya está corriendo."
else
    # Ejecutar la máquina virtual DVWA
    echo "Ejecutando la máquina virtual DVWA..."
    sudo docker run -d --name dvwa_container -p 80:80 vulnerables/web-dvwa
    exit_on_error "No se pudo ejecutar la máquina virtual DVWA"
    echo "Máquina virtual DVWA ejecutada correctamente."
fi

# Acceder a DVWA en el navegador
echo "Accede a DVWA en tu navegador: http://127.0.0.1"
echo "Usuario: admin"
echo "Contraseña: password"
echo "Recuerda hacer clic en el botón 'Create / Reset Database'."

# Detener el servidor Apache en caso de problemas
echo "Deteniendo el servidor Apache en caso de problemas..."
sudo service apache2 stop
echo "Servidor Apache detenido correctamente."

# Mostrar mensaje para detener el contenedor manualmente si es necesario
echo "Si necesitas detener el contenedor DVWA, ejecuta: sudo docker stop dvwa_container"
