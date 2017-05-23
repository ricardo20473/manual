#!/bin/bash

sudo apt-get update
sudo apt-get install apache2 -y

sudo apt-get install mysql-server -y


sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt-get install php5.6 -y
sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml -y
sudo apt-get install php5.6-dev php5.6-mcrypt php5.6-curl php5.6-mysql php5.6-mongo php5.6-memcached php5.6-xdebug php5.6-apc php5.6-imagick php5.6-gd php5.6-geoip gcc git libpcre3-dev php5.6-fpm -y

