# Serial Key- Licence Sublime Text 3 - Linux Windows

—– BEGIN LICENSE —– 
Michael Barnes 
Single User License 
EA7E-821385 
8A353C41 872A0D5C DF9B2950 AFF6F667 
C458EA6D 8EA3C286 98D1D650 131A97AB 
AA919AEC EF20E143 B361B1E7 4C8B7F04 
B085E65E 2F5F5360 8489D422 FB8FC1AA 
93F6323C FD7F7544 3F39C318 D95E6480 
FCCC7561 8A4A1741 68FA4223 ADCEDE07 
200C25BE DBBC4855 C4CFB774 C5EC138C 
0FEC1CEF D9DCECEC D3A5DAD1 01316C36 
—— END LICENSE — 

# Configuraciones Básicas para Sublime Text

Primero editaremos la configuración de user: en sublime text vamos a PREFERENCES->SETTINGS-USER y remplazamos por el siguiente codigo.

    {
        // Cuadrado del minimapa: Esta propiedad nos permite activar el cuadrado del mini mapa que nos muestra donde estamos, por lo general se muestra cuando pasamos el mouse por el minimapa, pero con esta propiedad, siempre sera visible.
        "always_show_minimap_viewport": true,
        // Nombre de las carpetas en negritas: Esta propiedad,lo que hace es muestrar el nombre de las carpetas en negrita y el el nombre de los archivos los muestra normal, permitiendo identificar mas rapido que es un archivo y que es una carpeta.
        "bold_folder_labels": true,
        //Ocultar trozo de codigo: Esta propiedad nos muestra al lado del numero de la linea, una flecha que nos permite ocultar un bloque de codigo, como ejemplo seria un div y su contenido.
        "fade_fold_buttons": false,
        //Tamaño de fuente en el sublime text
        "font_size": 14,
        //para que tome las tab mas pequeñas
        "tab_size": 1,
        //Resaltar línea actual: Esta propiedad permite que se resalte la línea actualmente seleccionada.
        "highlight_line": true,
        //Para identifcar aquellos ficheros del proyecto actual que aún no han sido salvados, ésta opción resaltará aquellas pestañas de los archivos modificados dentro del programa
        "highlight_modified_tabs": true,
        "ignored_packages":
        [
            "Vintage"
        ],
        //Guarda los archivos cuando el programa pierde el foco de la aplicación. Te ahorrarás muchos CTRL+S y la posibilidad olvidarte de guardarlo cuando deberías.
        "save_on_focus_lost": true,
        //El scroll horizontal puede ser un dolor de cabeza. Con la opción word wrap activada, el texto flotará hasta el tamaño de tu pantalla e impedirá que tengas que hacer scroll horizontal.(es como el ajuste de linea que aplicamos en el bloc de notas)
        "word_wrap": true,
        //convierte el tamaño del tab mas pequeño solo en la visualizacion de sublime
        "tab_size": 1,
        //convierte los tab por espacios
        "translate_tabs_to_spaces": true
    }

# Ahora editaremos la configuración del teclado de user

En sublime text vamos a PREFERENCES->KEY BINDGINS-USER y remplazamos por el siguiente codigo.

    [
        // ocultar side bar solo con ctrl+b
        { "keys": ["ctrl+b"], "command": "toggle_side_bar" },
        {//si utilizan livereload(plugin de sublime text) les permitira recargar la pagina presionando el comando a continuación
        "keys": ["ctrl+shift+r"], "command": "browser_refresh", "args": {
                "auto_save": true,
                "delay": 0.0,
                "activate_browser": true,
                "browser_name" : "all"
            }
        },
        /*cerrar la plegar actual*/
        { "keys": ["ctrl+-"], "command": "fold" },
        /*abrir las plegar actual*/
        { "keys": ["ctrl++"], "command": "unfold" },
       
        { "keys": ["ctrl+shift+alt+-"], "command": "fold_tag_attributes" },
        /*abrir TODAS las plegar actual*/
        { "keys": ["ctrl+shift+alt++"], "command": "unfold_all" },
        { //para realizar comentario de una linea
        "keys": ["ctrl+7"], "command": "toggle_comment", "args": { "block": false } },
        {//para realizar comentarios de bloque
        "keys": ["ctrl+shift+7"], "command": "toggle_comment", "args": { "block": true } },
        {//incrementar el tamaño de fuente en sublime text
        "keys": ["ctrl+shift++"], "command": "increase_font_size" },
        {//incrementar el tamaño de fuente en sublime text
        "keys": ["ctrl+="], "command": "increase_font_size" },
        {//decrementar el tamaño de fuente en sublime text
        "keys": ["ctrl+shift+-"], "command": "decrease_font_size" },
        {//mostrar el auto completado
        "keys": ["ctrl+space"], "command": "auto_complete" },
        { "keys": ["ctrl+space"], "command": "replace_completion_with_auto_complete", "context":
            [
                { "key": "last_command", "operator": "equal", "operand": "insert_best_completion" },
                { "key": "auto_complete_visible", "operator": "equal", "operand": false },
                { "key": "setting.tab_completion", "operator": "equal", "operand": true }
            ]
        }
    ]

# Package Control

El método más simple de la instalación es a través de la consola de texto sublime. La consola se accede a través de las teclas *Ctrl + `* contextual o en el menú View > Show Console. Una vez abierto, pegar el código Python apropiado para su versión de texto sublime en la consola.

    import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

Ahora, cada vez que queramos buscar un paquete en el repositorio para instalarlo, pulsamos **CTRL+SHIFT+P** y escribimos Install Package. Entonces podremos buscar entre la gran cantidad de paquetes que existen para Sublime Text e instalarlos con un simple click.

### Plugins para uso básico

* AutoFileName
* ColorPicker
* Git Gutter
* SublimeLinter
* SublimeLinter php
* SublimeLinter-jshint
* SFTP
* Aurora Scheme (tema)

Note: Para activar SublimeLinter-jshint, se debe asegurar que jshint está instalado en su sistema. Para instalar jshint, haga lo siguiente:

    1. Install Node.js (and npm on Linux).
    2. Install jshint by typing the following in a terminal:
        npm install -g jshint
