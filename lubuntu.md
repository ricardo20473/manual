# Instalaciones necesarias para lubuntu

## Control de audio 

    sudo apt-get install pulseaudio
    sudo apt-get install pavucontrol pavumeter
    sudo apt-get install indicator-sound

## Tema Numix

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install numix-gtk-theme numix-icon-theme-circle

## Gimp editor de imagenes

    sudo apt-get install gimp
    sudo apt-get install gimp-help-es

## Instalar gnome-screenshot

    sudo apt-get update
    sudo apt-get install gnome-screenshot

## Ajuste automático de hora en ubuntu (con ntp)

1 – Setear sincronización por internet

En el panel superior, haremos clic en la hora y seleccionaremos “Configuración de fecha y hora”.  Seleccionamos luego “Automáticamente desde internet”. Cerramos la ventana.

2 – Instalar ntp

Para instalar el paquete ntp, abrimos un terminal y escribimos

    $ sudo aptitude install ntp

3 – Editar la configuración

Editaremos la configuración (que está en /etc/ntp.conf). Buscamos el siguiente bloque

    # Use servers from the NTP Pool Project. Approved by Ubuntu Technical Board
    # on 2011-02-08 (LP: #104525). See http://www.pool.ntp.org/join.html for
    # more information.
    server 0.ubuntu.pool.ntp.org
    server 1.ubuntu.pool.ntp.org
    server 2.ubuntu.pool.ntp.org
    server 3.ubuntu.pool.ntp.org

y reemplazamos por los servidores correspondientes a nuestra zóna geográfica. Yo, por ejemplo, tengo esta configuración

    server ntp.ubuntu.com

4 – Reiniciar el servicio

    $ sudo service ntp restart
    
    apt-get update
    apt-get install ntpdate
    sudo ntpdate -u ntp.ubuntu.com

y verificamos con

$ date

## Formato de fecha y hora para linux

    %A %d de %B del %Y %l:%M %p

## Comentar linea de codigo para error de repositorio en linux 16.04

    sudo nano /etc/apt/sources.list

## Flash Player

    sudo apt-get install flashplugin-installer
    sudo apt-get update
    sudo apt-get install adobe-flashplugin

Eliminar versiones previas de Flash
    
    sudo apt purge --remove adobe-flashplugin flashplugin-installer pepperflashplugin-nonfree

Flash Player v.21 para 64bit
En 64 bits es mucho más fácil tener la versión más reciente de Flash. Esta versión instalará Pepper Flash Plugin. Antes solamente servía para Chromium, pero ahora por suerte también sirve para Firefox. De esta manera Firefox ya no se queda atrás con una versión precaría de Flash.

    sudo apt install browser-plugin-freshplayer-pepperflash 

Flash Player v.11 para 32bit
Cada vez más la versión 32 bits se está volviendo más obsoleto y cada vez hay menos mantenimiento. Pepper Flash ya no funciona en la versión de 32 bits, pero hay muchos usuarios que todavía usan Chromium ya que Chrome no tiene soporte para la versión 32 bits de Ubuntu.

    sudo apt install adobe-flashplugin

Este paquete instalará la misma versión de Flash para Firefox y Chromium.

Revisar tu versión de Flash
Para los dos navegadores en la barra de direcciones pongan

    Chromium – chrome://plugins

    Firefox – about:plugins

## MAKE: ORDEN NO ENCONTRADA (virtualbox)

    sudo apt-get install build-essential

## Compartir carpeta (virtualbox)

    sudo mount -t vboxsf linux /home/ricardo/win7


Encontrar un nombre de la VM (Máquina Virtual) - ejecución de VB (virtualbox), seleccione la máquina virtual, abra configuración, en la pestaña "General" compruebe el nombre, por ejemplo, en mi caso ubuntu 12.04 32bit

En Windows, inicie un intérprete de línea de comandos, vaya a la C:\Program Files\Oracle de carpeta y haga clic en virtualbox a seleccionar, a continuación, la celebración de la izquierda de la tecla shift, hacer un ratón botón derecho del ratón y seleccione "Abrir ventana de comandos aquí" en el menú, el intérprete tiene que estar funcionando
Pegue el siguiente comando (cambiar el nombre de máquina virtual a tu nombre!): 

    VBoxManage setextradata "lubuntu-1" "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled" 1

Finalmente, inicio de ubuntu cliente y establecer la hora y la fecha manualmente.

    Fuente: https://www.enmimaquinafunciona.com/pregunta/30657/como-manualmente-configurar-la-hora-del-sistema-en-virtualbox