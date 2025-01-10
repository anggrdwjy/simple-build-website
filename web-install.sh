#!/bin/bash
sudo apt update
sudo apt install software-properties-common -y
sudo apt install apache2 -y
sudo apt install php -y
sudo apt install mysql-server -y
echo -n "Password Root Your Database: ";
read passmysql
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passmysql';" 
sudo apt install phpmyadmin -y
sudo apt install zip unzip php-zip
systemctl restart apache2
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress /var/www/html/blog/
mysql -u root -p -e "CREATE DATABASE wordpress;" 
chmod o+w /var/www/html/blog
chown www-data:www-data -R /var/www/html/blog
