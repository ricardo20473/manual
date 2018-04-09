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

Versión 3143

    —– BEGIN LICENSE —–
    TwitterInc
    200 User License
    EA7E-890007
    1D77F72E 390CDD93 4DCBA022 FAF60790
    61AA12C0 A37081C5 D0316412 4584D136
    94D7F7D4 95BC8C1C 527DA828 560BB037
    D1EDDD8C AE7B379F 50C9D69D B35179EF
    2FE898C4 8E4277A8 555CE714 E1FB0E43
    D5D52613 C3D12E98 BC49967F 7652EED2
    9D2D2E61 67610860 6D338B72 5CF95C69
    E36B85CC 84991F19 7575D828 470A92AB
    —— END LICENSE ——

# Configuraciones Básicas para Sublime Text

Primero editaremos la configuración de user: en sublime text vamos a PREFERENCES->SETTINGS-USER y remplazamos por el siguiente codigo.

    {
        // Cuadrado del minimapa: Esta propiedad nos permite activar el cuadrado del mini mapa que nos muestra donde estamos, por lo general se muestra cuando pasamos el mouse por el minimapa, pero con esta propiedad, siempre sera visible.
        "always_show_minimap_viewport": true,
        // Nombre de las carpetas en negritas: Esta propiedad,lo que hace es muestrar el nombre de las carpetas en negrita y el el nombre de los archivos los muestra normal, permitiendo identificar mas rapido que es un archivo y que es una carpeta.
        "bold_folder_labels": false,
        //Ocultar trozo de codigo: Esta propiedad nos muestra al lado del numero de la linea, una flecha que nos permite ocultar un bloque de codigo, como ejemplo seria un div y su contenido.
        "fade_fold_buttons": false,
        //Tamaño de fuente en el sublime text
        "font_size": 11,
        //para que tome las tab mas pequeñas
        "tab_size": 4,
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
        "word_wrap": false,
        //convierte los tab por espacios
        "translate_tabs_to_spaces": true,
        "detect_indentation": true
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

    https://packagecontrol.io/installation

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
* Pretty Json
* SublimeLinter-contrib-tslint

Note: Para activar SublimeLinter-jshint, se debe asegurar que jshint está instalado en su sistema. Para instalar jshint, haga lo siguiente:

    1. Install Node.js (and npm on Linux).
    2. Install jshint by typing the following in a terminal:
        sudo npm install -g jshint
        sudo npm install -g tslint
