# Gulp Globalmente

Primero intente instalar Gulp para que este disponible en todo el proyecto pero no logré hacerlo correr. Así que este tutorial se basará en instalar Gulp para tu proyecto actual.

##Comenzamos a usar Gulp.js

Antes que nada necesitamos que el comando Gulp este disponible para cualquier proyecto, así que lo instalamos (en teoría esto permite tenerlo Gulp Global pero no me funcionó). 

    npm install -g gulp
 
## 1- Creando el archivo package.json

Vamos a crear una carpeta X en alguna ruta especifica y vamos a copiar dicha ruta en la consola. Ejem:

    cd www/miproyecto

Ahora que estamos posicionado en dicha ruta, lo que debemos hacer es configurar Gulp.js para nuestra carpeta que hemos establecido. Para ello ejecutamos el siguiente comando.

    npm init

Nos van a solicitar una serie de preguntas, todas estas son necesarias para crear el archivo de configuración que Gulp necesita, agregar los valores de la siguiente manera:

- **name:** demo
- **version:** 1.0.0
- **escription:** proyecto de prueba con Gulp
- **entrypoint:** gulpfile.js

Los demas valores los ignoramos presionando la tecla ENTER. Al final, nos van a solicitar confirmar la acción, escribimos yes.

Si todo ha salido bien, vamos a tener creado en nuestra carpeta el siguiente archivo un package.json que contiene los parámetros que escribimos hace un instante.

    {
      "name": "demo",
      "version": "1.0.0",
      "description": "proyecto de prueba con Gulp",
      "main": "gulpfile.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "",
      "license": "ISC"
    }
 

## 2- Agregando dependencias a gulpfile para combinar archivos y minificar
Instalando gulp en nuestro proyecto

    npm install --save-dev gulp
 

Para combinar archivos debemos agregar la dependencia de gulp-concat:

    npm install --save-dev gulp-concat

Luego uglify que nos permite minificar archivos JS

    npm install --save-dev gulp-uglify

Y para minificar archivos CSS

    npm install --save-dev gulp-minify-css

Si entramos a nuestra carpeta, se va a crear una carpeta nueva llamada node_modules, ahí se encuentra la dependencia que hemos descargado. Adicionalmente, nuestra package.json ha sido actualizado, se agregado las dependencias que necesita nuestro proyecto.

Hecho todo estos pasos, nos queda crear 4 archivos para nuestra prueba, para ello creamos una carpeta llamada source y agregamos los siguientes archivos.

source/a.js

    var suma = function(a, b)
    {
        return a + b;
    }

source/b.js

    var resta = function(a, b)
    {
        return a - b;
    }

source/a.css

    body{margin:0;padding:0;}

source/b.css

    p{color:#eee;}
 

## 3- Inicializando la tarea

Si se dieron cuenta en nuestro archivo package.json, hay una propiedad llamada main, este main hace referencia a un archivo javascript, vamos a crear este archivo gulpfile.js, ya que este es el encargado de decirle a gulp que ejecute la tarea que vamos a crear y adicionalmente una carpeta llamada build, en esta vamos a publicar la tarea que realice gulp. Dentro de gulpfile.js vamos agregar el siguiente código.

    // Dependencias
    var    gulp = require('gulp'),
         concat = require('gulp-concat'),
         uglify = require('gulp-uglify'),
      minifycss =require('gulp-minify-css');

    // Tarea 1 llamada minify-js
    gulp.task('minify-js', function () {
      gulp.src('source/*.js')
      .pipe(concat('application.js'))
      .pipe(uglify())
      .pipe(gulp.dest('build/'))
    });

    // Tarea 2 llamada minify-css
    gulp.task('minify-css', function () {
      gulp.src('source/*.css')
      .pipe(concat('application.css'))
      .pipe(minifycss())
      .pipe(gulp.dest('build/'))
    });

Nuestro script es bastante simple, la primera parte levanta las dependencias, la segunda es la encargada de unificar y minificar los archivos JS y la tercera hace lo mismo que la segunda pero con los archivos CSS. Al final, los nuevos archivos se ven en la carpeta build, estos se llaman application.js y application.css.

Para ejecutar las tareas solo debemos escribir gulp y el nombre de la tarea a ejecutar:

    gulp minify-js
    gulp minify-css

Si todo ha salido bien deberíamos ver el tiempo que tardo en ejecutarse el script en vez de un error.

## 4- Agregar todas las tareas a una sola

¿What?, lo que quiero decir que en la práctica vamos a estar constantemente ejecutando estas tareas, en vez de hacer las tareas por separadas vamos a crear una nueva que se llame optimiza-web y está ejecutará las 2 tareas que hemos creado previamente.

Bien, nuestro archivo gulpfile.js ha quedado de la siguiente manera:

    var    gulp = require('gulp'),
         concat = require('gulp-concat'),
         uglify = require('gulp-uglify'),
      minifycss =require('gulp-minify-css');

    gulp.task('optimiza-web', ['minify-js', 'minify-css']);

    gulp.task('minify-js', function () {
      gulp.src('source/*.js')
      .pipe(concat('application.js'))
      .pipe(uglify())
      .pipe(gulp.dest('build/'))
    });

    gulp.task('minify-css', function () {
      gulp.src('source/*.css')
      .pipe(concat('application.css'))
      .pipe(minifycss())
      .pipe(gulp.dest('build/'))
    });

Ahora solo debemos correr el comando gulp optmiza-web para ejecutar la tarea que ejecuta las demás tareas.

    gulp optmiza-web

Con gulp se puede hacer muchas cosas, les comparto esta página donde podrán ver todas las dependencias que hay para gulp.js, hay una bastante interesante para optimizar imágenes.

¿Les parecio sencillo?, pues la verdad a mi pareció bastante facil, si no han entendido pueden comentar y les ayudaré con gusto, adjunto el archivo realizado por si se perdieron.

