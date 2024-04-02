Script de Configuración DVWA (Damn Vulnerable Web Application)
Este script automatiza la configuración inicial de DVWA (Damn Vulnerable Web Application), una aplicación web deliberadamente vulnerable utilizada para fines educativos y de prueba de penetración. El script realiza las siguientes tareas:

Verificación e Instalación de Docker:

Verifica si Docker está instalado en el sistema.
Si Docker no está instalado, lo instala automáticamente utilizando el administrador de paquetes apt.
Inicio de Docker:

Verifica si Docker está en ejecución.
Si Docker no está en ejecución, inicia el servicio de Docker.
Descarga de la Imagen DVWA:

Descarga la imagen de DVWA desde el repositorio oficial de Docker Hub (vulnerables/web-dvwa).
Ejecución de la Máquina Virtual DVWA:

Verifica si ya hay un contenedor DVWA en ejecución.
Si no hay ningún contenedor DVWA en ejecución, ejecuta un nuevo contenedor utilizando la imagen de DVWA descargada.
El contenedor se ejecuta en segundo plano y expone el puerto 80 en el host para acceder a la aplicación web.
Acceso a DVWA en el Navegador:

Después de que el contenedor DVWA se inicia con éxito, el script muestra la URL para acceder a DVWA en el navegador web.
Proporciona las credenciales predeterminadas de DVWA (Usuario: admin, Contraseña: password).
Se recomienda hacer clic en el botón "Create / Reset Database" para configurar la base de datos de la aplicación.
Detención del Servidor Apache:

En caso de problemas con el servidor Apache en el sistema anfitrión, el script detiene el servicio de Apache para evitar conflictos de puertos.
Instrucciones para Detener el Contenedor DVWA:

El script proporciona instrucciones simples para detener manualmente el contenedor DVWA si es necesario.
