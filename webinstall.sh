#!/bin/bash
sudo apt update
sudo apt install software-properties-common -y
sudo apt install zip unzip -y
sudo timedatectl set-timezone Asia/Jakarta 
sudo timedatectl set-ntp on
sudo apt install apache2 -y
cp /etc/apache2/apache2.conf apache2.conf.bak
cp support/apache2.conf /etc/apahce2/
cp /var/www/html/index.html index.html.bak
cp support/index.html /var/www/html/
systemctl restart apache2
sudo apt install mysql-server -y
echo -n "Password Your Database: ";
read passmysql
mysql -e "CREATE DATABASE wordpress;" 
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passmysql';"
sudo apt install php php-cli php-zip libapache2-mod-php php-mysql -y
cp /etc/apache2/mods-enabled/dir.conf dir.conf.bak
cp support/dir.conf /etc/apache2/mods-enabled/
cp /etc/php/*/cli/php.ini cli-php.ini.bak
cp /etc/php/*/apache2/php.ini apache-php.ini.bak
cp support/php.ini /etc/php/*/cli/
cp support/php.ini /etc/php/*/apache2/
systemctl restart apache2
wget https://wordpress.org/latest.zip && unzip latest.zip
mv wordpress /var/www/html/blog
chown $USER:$USER -R /var/www/html/blog
chmod o+w /var/www/html/blog
systemctl restart apache2
iptables -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 20 --connlimit-mask 40 -j DROP
