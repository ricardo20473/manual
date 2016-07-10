# Instalar Phalcon en Ubuntu

Phalcon es una extensión en C, así que necesitarás descargar un binario para tu plataforma o compilarlo desde el código fuente

Para instalar Phalcon en Ubuntu es necesario seguir estos pasos:

    sudo apt-get install php5-dev libpcre3-dev gcc make php5-mysql
    sudo apt-add-repository ppa:phalcon/stable
    sudo apt-get update
    sudo apt-get install php5-phalcon
    sudo a2enmod rewrite
    sudo service apache2 restart
    sudo nano /etc/apache2/sites-available/000-default.conf
        <Directory "/var/www/html">
          AllowOverride All
        </Directory>
