#!/bin/bash

# MariaDB install
apt-get install mariadb-common mariadb-server mariadb-client -y

# Start mysql and add `user` user with all privileges
service mysql start
mysql -u root -e "CREATE USER 'user'@'localhost' IDENTIFIED BY 'user'; GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost'; FLUSH PRIVILEGES;"

# Install phpmyadmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password user' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password user' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password user' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
apt-get install phpmyadmin -y
