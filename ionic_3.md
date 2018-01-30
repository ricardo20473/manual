#Ionic 3

Priori Things
First you need to setup the environment variables. For this you need to consider 3 files:

1. ~/.profile (For setting up the variables every time terminal opens or computer boots up):

Code that you need to append at the last

    set PATH so it includes user's private bin directories
    PATH="$HOME/bin:$HOME/.local/bin:$PATH"
    export ANDROID_HOME='/home/ricardo/Android/Sdk'
    export PATH=$PATH:$ANDROID_HOME/bin
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/platform-tools

2. /etc/environment (to set the environment variables):

All the content of the file

    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
    JAVA_HOME="/usr/lib/jvm/java-8-oracle"
    ANDROID_HOME="/home/ricardo/Android/Sdk"

3. /etc/profile:

Code that you need to add at the last

    JAVA_HOME=/usr/lib/jvm/java-8-oracle
    JRE_HOME=$JAVA_HOME/jre 
    PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
    export JAVA_HOME
    export JRE_HOME
    export PATH

For loading the above changes made to the file you need to run the following command:

    source ~/.profile
    source /etc/environment
    source /etc/profile

# Solucionar problema de  websockets "ws"

Ubicacion de ws version 3.3.3 package-lock.json
    
    npm install ws@3.3.2

    sudo apt-get install gradle