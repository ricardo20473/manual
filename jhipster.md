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
    sudo npm install -g yarn

Con estos sencillos pasos JHipster ha sido instalado de forma exitosa.

# Instalar spring en linux

Descargar Eclipse Spring

    https://spring.io/tools

**Crear icono o lanzador de android studio en linux**

Crear un archivo que se llame EclipseSpring.desktop y colocarlo en la ruta /usr/share/applications

    [Desktop Entry]
    Version=4.6.2
    Type=Application
    Name=Eclipse Spring
    Comment=IDE Eclipse Spring
    Exec="/home/ricardo/IDE/sts-bundle/sts-3.8.4.RELEASE/STS"
    Icon=/home/ricardo/IDE/sts-bundle/sts-3.8.4.RELEASE/icon.xpm
    Terminal=false
    Categories=Development;IDE;Java;
    StartupNotify=true
    StartupWMClass=Eclipse

# Install Apache Maven

You can download the latest stable version of Apache Maven from its official website, otherwise you can download it directly with the following command:

    cd /opt/
    wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz

Once the download has completed, extract the downloaded archive.

    sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz

Next, rename the extracted directory.

    sudo mv apache-maven-3.3.9 maven 

**Setup environment variables**

Next, you will need to setup the environment variables such as M2_HOME, M2, MAVEN_OPTS, and PATH. You can do this by creating a mavenenv.sh file inside of the /etc/profile.d/ directory.

    sudo nano /etc/profile.d/mavenenv.sh

Add the following lines:

    export M2_HOME=/opt/maven
    export PATH=${M2_HOME}/bin:${PATH}

Save and close the file, then load the environment variables with the following command:

    source /etc/profile.d/mavenenv.sh

**Verify installation**

Once everything has been successfully configured, check the version of the Apache Maven.

    mvn -V

You should see the following output:

    Apache Maven 3.3.9 (bb52d8502b132ec0a5a3f4c09453c07478323dc5; 2015-11-10T22:11:47+05:30)
    Maven home: /opt/maven
    Java version: 1.8.0_101, vendor: Oracle Corporation
    Java home: /usr/lib/jvm/java-8-oracle/jre
    Default locale: en_US, platform encoding: ANSI_X3.4-1968
    OS name: "linux", version: "3.13.0-32-generic", arch: "amd64", family: "unix"