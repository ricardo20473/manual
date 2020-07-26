# Docker

Instalar Docker descargando la aplicación desde la web 
https://www.docker.com/get-started

## Docker Machine

    // Crear maquina virtual con virtualbox
    docker-machine create -d virtualbox --virtualbox-memory 4096 dev
    docker-machine dev start
    docker-machine dev stop

## Iniciar Docker

    // Descargar imagen ubuntu
    docker pull ubuntu:18.04

    // Listar imagenes
    docker images

## Crear contenedor

    // Iniciar nuevo contenedor con la imagen descargada
    docker run --name nombre_contenedor -dit ubuntu:18.04

    // Listar contenedores
    docker ps

    // Listar contenedores activos
    docker ps -a

## Ingresar nuevamente al contenedor creado

    docker attach ID o nombre del contenedor  

## Sincronizar carpetas

    docker run -v /host/directory:/container/directory -other -options image_name command_to_run 
    docker run -v  e:/proyectos:/var/www/html ubuntu:18.04

## Docker ayuda

    docker --help

## Guardar contenedores funcionales para reutilizar

    docker commit nombre_contenedor asignar_nombre_image

## Activar puertos

    docker run -dit -p 81:80 nombre_contenedor /usr/sbin/apache2ctl -D FOREGROUND

    // Activar puertos para apache2 linux
    docker run -dit -p 81:80 nombre_contenedor /usr/sbin/apache2ctl -D FOREGROUND

## Despues de hacer pull apache:01 (Propia)

	docker pull apache:01
	docker images
	docker run -dit --name local -p 80:80 -p 81:81 -p 8000:8000 -v e:/proyectos:/var/www/html apache:01
	docker attach local

## Levantar los servicios del contenedor

	service apache2 restart
	service mysql restart
	chown -R mysql:mysql /var/lib/mysql //si no funciona los servicios de mysql
	cp -R /usr/share/phpmyadmin /var/www/html //mover la carpeta phpmyadmin a la carpeta html

<<<<<<< HEAD
## Configuraciones node y npm

    chmod -R 777 app/
    git config --global url.https://github.com/.insteadOf git://github.com/
    npm cache clean --force
    npm cache verify
=======
# Docker Compose 

Crear archivo docker-compose.yml y agregar el siguiente codigo en el archivo

    version: '3'
    services:
      web:
        image: 'ubuntu:18.04'
        ports:
          - '8080:81'
          - '3000:3000'
          - '4200:4200'
        stdin_open: true
        tty: true

Iniciar Docker

    docker-compose create
    docker-compose up
    docker-compose up -d //Actualizar docker con las configuraciones del archivos
    docker-compose start
    docker-compose stop

>>>>>>> 2500afdb799d38a779a54b47a922b95fb583b1a6
