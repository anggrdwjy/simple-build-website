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
wget https://wordpress.org/latest.zip && unzip latest.zip
mv wordpress /var/www/html
chmod o+w /var/www/html
chown -R $USER:$USER /var/www/html
systemctl restart apache2
