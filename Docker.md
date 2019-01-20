# Docker

Instalar Docker descargando la aplicación desde la web 
https://www.docker.com/get-started

## Iniciar Docker

    // Descargar imagen ubuntu
    docker pull ubuntu:18.04

    // Listar imagenes
    docker images

## Crear contenedor

    // Iniciar nuevo contenedor con la imagen descargada
    docker run --name nombre_contenedor -it ubuntu:18.04 bash

    // Listar contenedores
    docker ps

    // Listar contenedores activos
    docker ps -a

## Ingresar nuevamente al contenedor creado

    docker attach ID o nombre del contenedor  

## Sincronizar carpetas

    docker run -v /host/directory:/container/directory -other -options image_name command_to_run 

## Docker ayuda

    docker --help

## Guardar contenedores funcionales para reutilizar

    docker commit nombre_contenedor asignar_nombre_image

## Activar puertos

    docker run -dit -p 81:80 nombre_contenedor /usr/sbin/apache2ctl -D FOREGROUND

    // Activar puertos para apache2 linux
    docker run -dit -p 81:80 nombre_contenedor /usr/sbin/apache2ctl -D FOREGROUND