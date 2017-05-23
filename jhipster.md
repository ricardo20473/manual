# Instalar jhipster en linux

Antes de iniciar con la creación de las aplicaciones debemos asegurarnos que tenemos el ambiente de trabajo instalado y configurado correctamente. Para esto debemos seguir los siguientes pasos:

Instalar y configurar la versión 8 de Java
    
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
    java -version

Instalar Node.js del sitio web, esto instalará el comando npm.
    
    wget -qO- https://deb.nodesource.com/setup_6.x | sudo bash -
    sudo apt-get update
    sudo apt-get install nodejs

Instalar Yeoman utilizando el comando 
    
    sudo npm install -g yo 

Solo para angular js (version 1)

    Instalar Bower utilizando el comando 
        sudo npm install -g bower
    Instalar Gulp utilizando el comando 
        sudo npm install -g gulp-cli

Instalar JHipster utilizando el comando 

    sudo npm install -g generator-jhipster

Con estos sencillos pasos JHipster ha sido instalado de forma exitosa.