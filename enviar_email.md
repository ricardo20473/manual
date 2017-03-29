# Como instalar y configurar un servidor de correo SMTP para enviar emails desde localhost con php. (Linux)

Si estas programando en tu entorno local “localhost” y quieres  mandar mails desde php necesitas tener instalado un servidor de correo  SMTP .

En entornos linux uno de los mas utilizado es  Postfix. Sin embargo si lo que queremos es simplemente poder enviar email desde nuestro entorno de puebas podemos optar por opciones mas livianas y simples.

Una opción ligera es instalar el paquete ssmtp.

En mi caso estoy trabajando desde un viejo portatil con lubuntu instalado, para otras distribuciones no derivadas de ubuntu el proceso de instalación puede ser diferente.

Para instalar el paquete  ssmtp abrimos un terminal y escribimos:

    sudo apt-get install ssmtp

Ahora debemos editar el archivo ssmtp.conf:

    sudo nano /etc/ssmtp/ssmtp.conf

Descomentamos o añadimos si no existen las siguientes lineas:

    mailhub=smtp.gmail.com:587
    UseSTARTTLS=YES 
    AuthUser=<YOUR-EMAIL>@gmail.com 
    AuthPass=<YOUR-PASSWORD>

Debemos sustituir lo que se encuentra entre “<” y “>”  por nuestros valores.

En este caso vamos a utilizar nuestra cuenta de gmail para enviar el correo así que en AuthUser pondremos nuestra dirección de mail de gmail y enAuthPass la contraseña que utilizamos para acceder a nuestra cuenta de gmail.

Si lo dejamos así en el from del los mails delante de la dirección de correo desde donde se envía aparecerá “www-data”, para poder cambiar el from desde php tenemos que añadir tambien la siguiente linea en  ssmtp.conf:

    FromLineOverride=YES

Ahora guardamos el archivo (Ctrl+O si lo editas con nano) y salimos (Ctrl+X).

Ahora tenemos que editar el archivo php.ini para asignar la variable 
    
    sendmail_path:

    sudo nano /etc/php5/apache2/php.ini

Buscamos la linea sendmail_path (Ctrl + W para buscar desde nano).

y la dejamos de la siguiente manera:

    sendmail_path = /usr/sbin/ssmtp -t

Guardamos (Ctrl + O) y salimos (Ctrl + X).

Reiniciamos el servidor apache:

sudo /etc/init.d/apache2 restart
