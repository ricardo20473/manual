#!/bin/bash

#Solo para windows 10 con kernel de ubuntu
#sudo apt-get install dos2unix
#dos2unix file -> Ejecutar comando para los archivos sh en windows 10

#Colores
blanco="\033[1;37m"
gris="\033[0;37m"
magenta="\033[0;35m"
rojo="\033[1;31m"
verde="\033[1;32m"
amarillo="\033[1;33m"
azul="\033[1;34m"
rescolor="\e[0m"

echo -e ""

echo -e "${verde}Inicializar los servicios de apache (localhost)"${rescolor}
sudo service apache2 restart

echo -e "${verde}Inicializar los servicios de MySQL (Base de datos)"${rescolor}
sudo service mysql restart

echo -e "${verde}Inicializar los servicios de redis"${rescolor}
sudo service redis-server start