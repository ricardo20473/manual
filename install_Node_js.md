# Cómo instalar la versión Node JS en Ubuntu

Ubuntu 14.04 contiene una versión de Node.js en sus repositorios por defecto que se pueden utilizar para proporcionar fácilmente una experiencia consistente a través de múltiples servidores.

Con el fin de obtener esta versión, sólo tenemos que utilizar el gestor de paquetes apt. Debemos actualizar nuestro índice local de paquetes antes y después instalar desde los repositorios:
	
	wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
    sudo apt-get update
    sudo apt-get install nodejs

Si el paquete en los repositorios se adapte a sus necesidades, esto es todo lo que necesita hacer para ponerse en marcha con Node.js. En la mayoría de los casos, usted también desea instalar también la NGP, que es el gestor de paquetes Node.js. Puede hacer esto escribiendo:

    sudo apt-get install npm
    sudo ln -s /usr/bin/nodejs /usr/bin/node