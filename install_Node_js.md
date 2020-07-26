# Cómo instalar la versión Node JS en Ubuntu

Ubuntu 14.04 contiene una versión de Node.js en sus repositorios por defecto que se pueden utilizar para proporcionar fácilmente una experiencia consistente a través de múltiples servidores.

Con el fin de obtener esta versión, sólo tenemos que utilizar el gestor de paquetes apt. Debemos actualizar nuestro índice local de paquetes antes y después instalar desde los repositorios:
    
    sudo apt-get install python-software-properties
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt-get update
    sudo apt-get install nodejs
    sudo npm install -g --unsafe-perm node-sass

Si el paquete en los repositorios se adapte a sus necesidades, esto es todo lo que necesita hacer para ponerse en marcha con Node.js. En la mayoría de los casos, usted también desea instalar también la NGP, que es el gestor de paquetes Node.js. Puede hacer esto escribiendo:

    sudo apt-get install npm
    sudo ln -s /usr/bin/nodejs /usr/bin/node


Manually change npm’s default directorys

1. Back up your computer.
2. On the command line, in your home directory, create a directory for global installations:

    mkdir ~/.npm-global

3. Configure npm to use the new directory path:

    npm config set prefix '~/.npm-global'

4. In your preferred text editor, open or create a ~/.profile file and add this line:

    export PATH=~/.npm-global/bin:$PATH

5. On the command line, update your system variables:

    source ~/.profile

6. To test your new configuration, install a package globally without using sudo:

    npm install -g jshint
    npm rebuild node-sass //restaurar

7. Solutions

    First download Python 2, then set the version of Python that node uses like this:

    npm config set python /usr/bin/python2.7
    npm install — global — production windows-build-tools
    npm install — global node-gyp
    npm install

    npm rebuild node-sass //restaurar
