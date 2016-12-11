# Instalar Apache en Ubuntu

El servidor web Apache es actualmente el servidor web más popular en el mundo, lo que hace que sea una gran opción por defecto para alojar un sitio web.

Podemos instalar fácilmente Apache utilizando el administrador de paquetes, apt. Un administrador de paquetes nos permite instalar software desde los repositorios mantenidos por Ubuntu.
Escribe en la terminal, los siguientes comandos:

    sudo apt-get update
    sudo apt-get install apache2

Desde que escribimos sudo, estas operaciones se ejecutarán con los privilegios del usuario root. Normalmente se te solicitará que introduzcas la contraseña para llevar a cabo estas operaciones.

Después de eso, tu servidor web está instalado.

Puedes verificar que todo salió sin problemas escribiendo la dirección local de tu servidor en el navegador web. Normalmente cualquiera de las siguientes dos puedes utilizar para ver tu servidor web en función.

    http://127.0.0.1
    http://localhost

Para poder configurar nuestro servidor se usa la siguiente sintaxis:

    sudo service apache2 [start | restart | stop | status]

# Instalar MySQL

Ahora que ya tenemos nuestro servidor web funcionando y activo, es hora de instalar MySQL. MySQL es un gestor de base de datos. Básicamente organizará y proveerá de acceso a todas las bases de datos donde nuestros sitios guarden información. De nuevo, usaremos apt para instalar nuestro servicio. Esta vez también instalaremos algunos paquetes más que nos ayudarán que nuestros componentes se comuniquen entre ellos:

    sudo apt-get install mysql-server php5-mysql

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

    sudo mv /usr/share/phpmyadmin /var/www/html (en nuestro caso)
    sudo chmod 777 -R /var/www/html/phpmyadmin

## Ubuntu 16.04 install php 5.6

Add the PPA

    sudo add-apt-repository ppa:ondrej/php

Install your PHP Version

    sudo apt-get update
    sudo apt-get install php5.6

You can install php5.6 modules too for example

    sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml

## So, steps to success:

vagrant ssh into your box
    
    sudo vim /etc/mysql/my.cnf

Copy and paste 

    [mysqld] sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION 

    sudo service mysql restart to restart MySQL.

Done!