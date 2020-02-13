#!/bin/bash

apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu bionic main'
apt-get update

# MariaDB install
apt-get install mariadb-server galera mariadb-client libmariadb3 mariadb-common -y

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
