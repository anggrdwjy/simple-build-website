#!/bin/bash
sudo apt update
sudo apt install software-properties-common -y
sudo apt install zip unzip -y
sudo apt install apache2 -y
sudo apt install mysql-server -y
echo -n "Password Your Database: ";
read passmysql
mysql -e "CREATE DATABASE wordpress;" 
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passmysql';"
sudo apt install php php-cli php-zip libapache2-mod-php php-mysql -y
mv /etc/apache2/mods-enabled/dir.conf dir.conf.bak
cp support/dir.conf /etc/apache2/mods-enabled/
mv /etc/php/8.3/apache2/php.ini php.ini.bak
cp support/php.ini /etc/php/8.3/apache2
systemctl restart apache2
mv /var/www/html/index.html index.html.bak
cp support/html-index.html /var/www/html/index.html
wget https://wordpress.org/latest.zip && unzip latest.zip
mv wordpress /var/www/html/blog
chown $USER:$USER -R /var/www/html/blog
chmod o+w /var/www/html/blog
systemctl restart apache2
cp support/checkserver.php /var/www/html/check.php
