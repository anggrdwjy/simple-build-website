#!/bin/bash
echo -n "Your Domain: ";
read domain
cp support/domain.conf /etc/apache2/sites-available/$domain.conf
mkdir /etc/apache2/ssl
cp support/template.pem /etc/apache2/ssl/domain.pem
cp support/template.key /etc/apache2/ssl/domain.key
a2ensite $domain.conf
a2dissite 000-default.conf
systemctl restart apache2
