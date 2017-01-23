# Instalar Oracle Java 8 en Ubuntu 16.04 LTS

Estoy probando Ubuntu 16.04 LTS y quería tener Oracle Java 8, así que manos a la obra. Entramos a la terminal y tecleamos lo siguiente:

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
    java -version

Sale por pantalla:

    java version "1.8.0_91"
    Java(TM) SE Runtime Environment (build 1.8.0_91-b14)
    Java HotSpot(TM) 64-Bit Server VM (build 25.91-b14, mixed mode)

# Instalar Android Studio en Ubuntu 16.04 LTS

Hace mucho que no toco algo sobre Android y quería volver a jugar un poco con ello. Antes al programar algunas cosas en Android usaba Eclipse. Ahora se usa mucho Android Studio y quería probarlo en Ubuntu 16.04 LTS.

Obs:

* Uso Ubuntu 16.04 LTS de 64 bits.
* Tener instalado Java Oracle 8.

Entramos a la terminal y tecleamos lo siguiente:

    sudo apt-add-repository ppa:paolorotolo/android-studio
    sudo apt-get update
    sudo apt-get install android-studio lib32stdc++6 mesa-utils
    cd /opt/android-studio/bin
    ./studio.sh