# Instalar postgres en ubuntu

    sudo apt-get install postgresql postgresql-contrib
    sudo su - postgres
        psql -d postgres -U postgres
        alter user postgres with password 'postgres';
        \q
        exit
    sudo apt-get install pgadmin3
    sudo apt-get install php5-pgsql


