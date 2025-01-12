#!/bin/bash
echo -n "Your Domain: ";
read domain
cp support/domain.conf /etc/apache2/sites-available/$domain.conf
nano /etc/apache2/ssl/$domain/domain.pem
nano /etc/apache2/ssl/$domain/domain.key
a2ensite $domain.conf
a2dissite 000-default.conf
systemctl restart apache2
