#!/bin/bash

# Apache install with PHP Support
apt-get install apache2 libapache2-mod-php7.0 -y

# Enable mod rewrite and .htaccess support, set proper ownerships
a2enmod rewrite
/bin/sed -i 's/AllowOverride\ None/AllowOverride\ All/g' /etc/apache2/apache2.conf
chown -R www-data:www-data /var/www/html
