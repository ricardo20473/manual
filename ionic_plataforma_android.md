# Ionic con plataforma Android

Lectura inicial:

https://statickidz.com/apps/ionic-framework-aplicaciones-html5/

Configuración base:
http://www.citronlab.com/programacion/configuracion-de-un-entorno-de-desarrollo-movil-para-apache-cordova-e-ionic/

Recomendado instalar:
https://www.mozilla.org/es-ES/firefox/developer/

Para que ionic funcione correctamente hay que agregar la ruta de java en el archivo .bashrc

    cd /home/ricardo
    sudo nano .bashrc

    JAVA_HOME="/usr/lib/jvm/java-8-oracle/bin"
    export JAVA_HOME
    PATH=$PATH:$JAVA_HOME
    export PATH

Arranque
Como siempre, tendremos que tener instalado Node.js. Una vez instalado, en una terminal ejecutamos:

    npm i -g cordova ionic

Nota: Ruta para la ubicacion del SDK se debe agregar en el archivo .profile
    
    cd /home/ricardo
    sudo nano .profile
    export ANDROID_HOME="/root/Android/Sdk"
    export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

    export ANDROID_HOME=/root/Android/Sdk
    export PATH=$PATH:/root/Android/Sdk/tools
    export PATH=$PATH:/root/Android/Sdk/platform-tools
    
    export ANDROID_HOME=/home/linux/Android/Sdk
    export PATH=$PATH:/home/linux/Android/Sdk/tools
    export PATH=$PATH:/home/linux/Android/Sdk/platform-tools
    export ANDROID_EMULATOR_FORCE_32BIT=true


Este comando lo dejará todo listo para empezar.
Crearemos una nueva aplicación usando la plantilla vacía de Ionic. Abriremos un terminal, nos dirigiremos a la ruta de nuestros proyectos y escribiremos:

    ionic start holaMundo blank
 
Una vez desplegada la aplicación, entraremos en la carpeta que se ha creado, añadiremos la plataforma deseada (en nuestro caso android) y realizaremos un primer “build” de nuestro proyecto:

    cd holaMundo
    ionic platform add android
    ionic build android
 
Y ya podemos probar la aplicación con nuestro emulador, puedes hacerlo:
En Firefox pulsando Ctrl-Shift-M.
En Chrome abriendo las herramientas de desarrollo (F12) y pulsando en el dibujito del teléfono arriba y en la izquierda
 
En primer lugar extraeremos el contenido principal de nuestra aplicación a una plantilla externa. Esto, en aplicaciones mas complejas, nos permitirá cambiar de sección rápidamente. Crearemos un nuevo fichero holaMundo\www\templates\ini.html con un contenedor ion-view que a su vez albergará un ion-content para mostrar el contenido final:

    <ion-view view-title="saludo" >
      <ion-content>
      saludo:  {{saludo}}
      </ion-content>
    </ion-view>
 
Ademas hemos añadido un texto “saludo:” y la variable que se actualizará desde el $scope, también llamada saludo.
Para que la página principal de la aplicación haga uso de esta plantilla y de paso, mejorar la navegación entre secciones (aunque ahora mismo sólo tengamos una), tenemos que hacer algunos cambios en el html. Reemplazaremos el contenido anterior del body por un contenedor ion-nav-view:

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
        <title></title>
        <link href="lib/ionic/css/ionic.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <!-- IF using Sass (run gulp sass first), then uncomment below and remove the CSS includes above
        <link href="css/ionic.app.css" rel="stylesheet">
        -->
        <!-- ionic/angularjs js -->
        <script src="lib/ionic/js/ionic.bundle.js"></script>
        <!-- cordova script (this will be a 404 during development) -->
        <script src="cordova.js"></script>
        <!-- your app's js -->
        <script src="js/app.js"></script>
        <script src="js/controllers.js"></script>
        <script src="js/services.js"></script>
      </head>
      <body ng-app="holaMundo">
        <ion-nav-view></ion-nav-view>
      </body>
    </html>

Y enlazaremos los ficheros javascript de controladores y servicios (el modelo) que crearemos a continuación:

    <script src="js/controllers.js"></script>
    <script src="js/services.js"></script>

Nuestro controlador será muy sencillo ya que sólo actualizará el $scope, a partir de la factoría que nos definiremos en los servicios:

    angular.module('holaMundo.controllers', [])
    .controller('iniCtrl', function($scope, Funciones) {
        $scope.saludo = Funciones.getSaludo();
    });
 
Y en services.js definimos el origen de los datos (para no complicar el tutorial, será un literal en el mismo método getSaludo). En el caso de hacer una llamada al servidor para devolver información desde una base de datos, este seria el lugar adecuado, como veremos en próximos artículos.

    angular.module('holaMundo.services', [])
    .factory('Funciones', function() {
        return {
            getSaludo: function(){
                return 'Hola mundo';
            }
        }
    });
 
Aunque prácticamente ya hemos hecho todo el trabajo, todavía no hemos terminado y es que necesitamos que al cargar la aplicación, se invoque el controlador iniCtrl. Editamos el fichero apps.js para modificarlo de la siguiente manera:

    angular.module('holaMundo', ['ionic', 'holaMundo.controllers', 'holaMundo.services'])
    .run(function($ionicPlatform) {
        $ionicPlatform.ready(function() {
            if(window.cordova && window.cordova.plugins.Keyboard) {
                cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
            }
            if(window.StatusBar) {
                StatusBar.styleDefault();
            }
        });
    })
    .config(function($stateProvider, $urlRouterProvider){
        $stateProvider
        .state('ini', {
            url: "/ini",
            templateUrl: "templates/ini.html",
            controller: 'iniCtrl'
        });
        $urlRouterProvider.otherwise('/ini');
    });
 
En la primera linea añadimos la carga de nuestros controladores y servicios. Dejaremos .run como estaba (sólo hemos borrado los comentarios) y añadimos una configuración para la aplicación.
El objeto $stateProvider es el que nos permitira declarar estados asociados a urls, un template y/o un controlador. De forma que nos definimos un estado “ini“, asociado a la url “/ini“, a la plantilla “templates/ini.html” y al controlador “iniCtrl”.

    .state('ini', {
        url: "/ini",
        templateUrl: "templates/ini.html",
        controller: 'iniCtrl'
    });
 
Y lo único que faltaba era asociar por defecto ese estado a nuestra aplicación:

    $urlRouterProvider.otherwise('/ini');
 
Evolución de la App v1:
 
Leyendo los tutoriales:
 
http://www.citronlab.com/programacion/ionic-recuperar-json-de-un-servidor-remoto/
 
https://joseucarvajal.wordpress.com/2015/05/07/login-en-el-lado-cliente-con-ionic-framework/
 
Mejorar la app para que solicite usuario y contraseña (admin/admin) y se conecte al backend del servidor DEV y en vez de presentar 'Hola mundo' presentaremos el nombre del usuario que inicia sesión.
 
Añadir validaciones:
Probando con un usuario que no existe
Probando conexión con una URL de servidor equivocada


Evolución de la App v2:

Añadir una pantalla splash al inicio
Añadir un loading en el proceso de login
Añadir una segunda ventana posterior al login donde se presenten los datos del usuario en formato formulario
Configurar la acción “Back” para que no presente la pantalla splash


Puntos a tener en cuenta:

- Nomenclatura del código fuente: nombrado de variables, métodos y clases,  tabulaciones en código, limpieza de código  
- Esquema del proyecto/solución 
- Comentario en el código fuente    
- Manejo de excepciones 
- División de funciones por capas, responsabilidades de cada capa/componente
- Tiempo de Entrega
- Manejo de importaciones de librerías o clases adecuados   
- Pruebas realizadas al código  
- Estructuración de tabla, consultas sql

Entrega
- Crear un repositorio personal en bitbucket y compartirlo con María y JJ
- Al finalizar cada etapa del tutorial (Hola Mundo, Evolución 1, Evolución 2) crear un tag en el repositorio para identificar cada etapa
- No debe subirse la carpeta “platforms”
- Al finalizar el tutorial, enviar un correo notificando finalización y un apk de cada una de las etapas

