#!/bin/bash
sudo apt update
sudo apt install software-properties-common -y
sudo apt install zip unzip -y
sudo apt install apache2 -y
sudo apt install mysql-server -y
echo -n "Password Root Your Database: ";
read passmysql
mysql -e "CREATE DATABASE wordpress;" 
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passmysql';"
sudo apt install php php-cli php-zip libapache2-mod-php php-mysql -y
mv /etc/apache2/mods-enabled/dir.conf dir.conf.bak
cp support/dir.conf /etc/apache2/mods-enabled/dir.conf
systemctl restart apache2
sudo apt install phpmyadmin -y
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress /var/www/html/blog/
chmod o+w /var/www/html/blog
chown www-data:www-data -R /var/www/html/blog/
