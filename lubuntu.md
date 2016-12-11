# Instalaciones necesarias para lubuntu

## Control de audio 

    sudo apt-get install pulseaudio
    sudo apt-get install pavucontrol pavumeter

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

y verificamos con

$ date
