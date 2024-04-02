#!/bin/bash

# Definir colores
COLOR_MAGENTA='\033[1;35m'
COLOR_VERDE='\033[0;32m'
COLOR_ROJO='\033[0;31m'
COLOR_RESET='\033[0m'

# Detener el servidor Apache en caso de problemas
echo -e "${COLOR_MAGENTA}Deteniendo el servidor Apache en caso de problemas...${COLOR_RESET}"
sudo service apache2 stop
echo -e "${COLOR_VERDE}Servidor Apache detenido correctamente.${COLOR_RESET}"

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
        echo -e "${COLOR_ROJO}Error: $1${COLOR_RESET}"
        exit 1
    fi
}

# Verificar si Docker está instalado
if ! check_installed docker; then
    echo -e "${COLOR_MAGENTA}Instalando Docker...${COLOR_RESET}"
    sudo apt update
    sudo apt install -y docker.io
    exit_on_error "No se pudo instalar Docker"
    echo -e "${COLOR_VERDE}Docker instalado correctamente.${COLOR_RESET}"
fi

# Iniciar Docker si no está en ejecución
if ! systemctl is-active --quiet docker; then
    echo -e "${COLOR_MAGENTA}Iniciando Docker...${COLOR_RESET}"
    sudo systemctl start docker
    exit_on_error "No se pudo iniciar Docker"
    echo -e "${COLOR_VERDE}Docker iniciado correctamente.${COLOR_RESET}"
fi

# Descargar la imagen DVWA (Damn Vulnerable Web Application)
echo -e "${COLOR_MAGENTA}Descargando la imagen DVWA...${COLOR_RESET}"
sudo docker pull vulnerables/web-dvwa
exit_on_error "No se pudo descargar la imagen DVWA"
echo -e "${COLOR_VERDE}Imagen DVWA descargada correctamente.${COLOR_RESET}"

# Verificar si el contenedor DVWA ya está corriendo
if sudo docker ps --format '{{.Names}}' | grep -q "dvwa_container"; then
    echo -e "${COLOR_VERDE}El contenedor DVWA ya está corriendo.${COLOR_RESET}"
else
    # Ejecutar la máquina virtual DVWA
    echo -e "${COLOR_MAGENTA}Ejecutando la máquina virtual DVWA...${COLOR_RESET}"
    sudo docker run -d --name dvwa_container -p 4200:80 vulnerables/web-dvwa
    exit_on_error "No se pudo ejecutar la máquina virtual DVWA"
    echo -e "${COLOR_VERDE}Máquina virtual DVWA ejecutada correctamente.${COLOR_RESET}"
fi

# Acceder a DVWA en el navegador
echo ""
echo -e "${COLOR_VERDE}Accede a DVWA en tu navegador: ${COLOR_RESET}"
echo ""
echo -e "${COLOR_MAGENTA}http://127.0.0.1:4200${COLOR_RESET}"
echo ""
echo -e "${COLOR_MAGENTA}Usuario: admin${COLOR_RESET}"
echo -e "${COLOR_MAGENTA}Contraseña: password${COLOR_RESET}"
echo ""
echo -e "${COLOR_MAGENTA}Recuerda hacer clic en el botón 'Create / Reset Database'.${COLOR_RESET}"
echo ""

# Mostrar mensaje para detener el contenedor manualmente si es necesario
echo -e "${COLOR_MAGENTA}Si necesitas detener el contenedor DVWA, ejecuta: sudo docker stop dvwa_container${COLOR_RESET}"
