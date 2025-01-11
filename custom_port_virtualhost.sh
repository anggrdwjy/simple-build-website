#!/bin/bash
echo -n "Your Domain: ";
read domain
cp support/custom-domain.conf /etc/apache2/sites-available/$domain.conf
cp support/custom-ports.conf /etc/apache2/ports.conf
nano /etc/apache2/ssl/$domain/domain.pem
nano /etc/apache2/ssl/$domain/domain.key
a2ensite $domain.conf
a2dissite 000-default.conf
a2enmod rewrite
a2enmod ssl
systemctl restart apache2
