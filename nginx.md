# Instalar Nginx en Ubuntu

El servidor web Nginx es actualmente el servidor web más popular en el mundo, lo que hace que sea una gran opción por defecto para alojar un sitio web.

Podemos instalar fácilmente Nginx utilizando el administrador de paquetes, apt. Un administrador de paquetes nos permite instalar software desde los repositorios mantenidos por Ubuntu.
Escribe en la terminal, los siguientes comandos:

    sudo apt-get update
    sudo apt install nginx

Desde que escribimos sudo, estas operaciones se ejecutarán con los privilegios del usuario root. Normalmente se te solicitará que introduzcas la contraseña para llevar a cabo estas operaciones.

Después de eso, tu servidor web está instalado.

Puedes verificar que todo salió sin problemas escribiendo la dirección local de tu servidor en el navegador web. Normalmente cualquiera de las siguientes dos puedes utilizar para ver tu servidor web en función.

    http://127.0.0.1
    http://localhost

Para poder configurar nuestro servidor se usa la siguiente sintaxis:

    sudo service nginx [start | restart | stop | status]

# Instalar MySQL

Ahora que ya tenemos nuestro servidor web funcionando y activo, es hora de instalar MySQL. MySQL es un gestor de base de datos. Básicamente organizará y proveerá de acceso a todas las bases de datos donde nuestros sitios guarden información. De nuevo, usaremos apt para instalar nuestro servicio. Esta vez también instalaremos algunos paquetes más que nos ayudarán que nuestros componentes se comuniquen entre ellos:

    sudo apt-get install mysql-server
    sudo mysql_secure_installation
    sudo mysql
    SELECT user,authentication_string,plugin,host FROM mysql.user;
    ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ZagaMarket_Cliente';
	uninstall plugin validate_password;
    FLUSH PRIVILEGES;
    SELECT user,authentication_string,plugin,host FROM mysql.user;
    exit

Durante la instalación el servidor de MySQL te solicitará que elijas una contraseña para tu usuario root. Esta es la cuenta administrativa de MySQL que contiene todos los privilegios para un usuario.  Asegurate de escribir una contraseña y no la olvides.

Cuando la instalación esté finalizada es necesario realizar unas cuantas configuraciones para que nuestro servidor MySQL esté un poco más seguro.

Primero, tenemos que decirle a MySQL cual será la estructura del directorio donde se almacenará la información. Podemos hacer esto de la siguiente manera:

    sudo mysql_install_db

# Instalar PHP

PHP es el lenguaje de programación que nos ayudará a realizar los sitios web. Puede ejecutar scripts, conectarse a la base de datos MySQL y procesar todo nuestro contenido del lado del servidor.

Haremos uso una vez más del paquete apt para instalar todas las librerias correspondientes.

    sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt

# Dar preferencia al archivo index.php

En la mayoría de los casos será mejor modificar la manera en que Apache busca la dirección de algún directorio solicitado. Normalmente, si un usuario solicita un directorio al servidor, lo primero que hará Apache es buscar un archivo de nombre index.html. Tenemos que decirle a Apache que estamos interesador en que primero busque los archivos index.php.

Para hacer esto, escribimos en la terminal lo siguiente.

    sudo gedit /etc/apache2/mods-enabled/dir.conf

Deberá verse como esto:

    DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm

Moveremos la posicion de index.php hasta la primera.

    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm

Guardaremos el archivo y reiniciaremos el servidor Apache para que aplique esos cambios a la configuración.

    sudo service apache2 restart

# Instalación de phpmyadmin

La instalación de phpmyadmin se puede realizar de forma automática con apt-get, pero se trata de un paquete que no se encuentra en el 'repositorio principal' (main) de ubuntu, sino que se encuentra en el 'repositorio universo' (universe). Para que apt-get pueda instalar paquetes del repositorio universo, es necesario editar el archivo /etc/apt/sources.list tal y como se explica en el capítulo Trucos.

Posteriormente, tendremos que actualizar en nuestro PC, el contenido de los repositorios:

Actualizar contenido de los repositorios

    sudo apt-get update

Ahora sí, podremos instalar el paquete 'phpmyadmin' mediante el comando:
Instalación de phpmyadmin

    sudo apt-get install phpmyadmin
    sudo apt-get install php-mbstring php-gettext

El programa de instalación crea un enlace simbólico en el DocumentRoot del servidor web para que la aplicación pueda ser accesible desde la url: http://ip-del-servidor-web/phpmyadmin/index.php. Si no se viera la aplicación en dicha url, quizás sea por algún aspecto de la configuración de apache. En tal caso, lo más sencillo sería mover la carpeta de phpmyadmin directamente dentro del DocumentRoot del servidor y asignar al usuario www-data que es el usuario con el que se ejecuta el apache, para que apache pueda acceder a dicha carpeta:

Colocar phpmyadmin en el servidor web y asignar propietario a www-data

    sudo cp /usr/share/phpmyadmin /var/www/html (en nuestro caso)
    sudo chmod 777 -R /var/www/html/phpmyadmin

## Ubuntu 16.04 install php 5.6

Add the PPA

	sudo apt install -y software-properties-common
    sudo add-apt-repository ppa:ondrej/php

Install your PHP Version

    sudo apt-get update

You can install php5.6 modules too for example

    sudo apt-get install php7.1
    sudo apt-get install php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-xml -y
    sudo apt-get install php7.1-dev php7.1-mcrypt php7.1-curl php7.1-mysql php7.1-mongo php7.1-memcached php7.1-xdebug php7.1-apc php7.1-imagick php7.1-gd php7.1-geoip gcc git libpcre3-dev php7.1-fpm -y

    sudo apt-get install php7.2
	sudo apt install php7.2 libapache2-mod-php
    sudo apt-get install php7.2-mbstring php7.2-mysql php7.2-xml -y
	sudo apt install php7.2-fpm php7.2-mysql
    sudo apt-get install php7.2-dev php7.2-curl php7.2-mysql php7.2-mongo php7.2-memcached php7.2-xdebug php7.2-apc php7.2-imagick php7.2-gd php7.2-geoip gcc git libpcre3-dev php7.2-fpm -y
	
	sudo service php7.2-fpm restart

## Switch PHP version:

From php5.6 to php7.0:
	Apache:
	
    sudo a2dismod php5.6 ; sudo a2enmod php7.1 ; sudo service apache2 restart
	
	CLI:
	sudo update-alternatives --set php /usr/bin/php7.0

From php7.0 to php5.6:
	Apache:
	
    sudo a2dismod php7.1 ; sudo a2enmod php5.6 ; sudo service apache2 restart
	
	CLI:
	sudo update-alternatives --set php /usr/bin/php5.6

## So, steps to success:

vagrant ssh into your box
    
    sudo nano /etc/mysql/my.cnf

Copy and paste 

    [mysqld] 
    sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION 

    sudo service mysql restart to restart MySQL.

Done!

## MySQL serve remote

    /etc/mysql/mysql.conf.d/mysqld.cnf
    service mysql restart
    netstat -tap | grep mysql

## Error en phpmyadmin

    Edit file /usr/share/phpmyadmin/libraries/sql.lib.php:

    sudo nano /usr/share/phpmyadmin/libraries/sql.lib.php
    Replace: count($analyzed_sql_results['select_expr'] == 1)

    With:  (count($analyzed_sql_results['select_expr']) == 1)

    Restart the server apache:

    sudo service apache2 restart
	
## Composer

Para instalar Composer tan sólo debemos de ejecutar lo siguiente:

	curl -sS https://getcomposer.org/installer | php
	
	// Una vez Composer está instalado, debemos de mover el ejecutable de Composer dentro de la ruta de nuestra máquina:
	mv composer.phar /usr/local/bin/composer
	
	// Le añadimos los permisos de ejecución:
	chmod +x /usr/local/bin/composer