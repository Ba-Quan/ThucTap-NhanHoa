#!/bin/bash

echo Domain Name:
read -e domain

echo “Database Name:
read -e dbName

echo “Database User:
read -e userName

echo “Database Pwd: 
read -e password

echo “Database Host: 
read -e dbHost

wget http://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz

cp wordpress/wp-config-sample.php wordpress/wp-config.php
sed -i "s/database_name_here/$dbName/g" wordpress/wp-config.php
sed -i "s/username_here/$userName/g" wordpress/wp-config.php
sed -i "s/password_here/$password/g" wordpress/wp-config.php
sed -i "s/localhost/$dbHost/g" wordpress/wp-config.php

mv wordpress/ /var/www/html/wordpress/
mv /var/www/html/wordpress/ /var/www/html/$domain

sudo mysql -u root -e "CREATE DATABASE $dbName"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON $dbName.* TO $userName@localhost IDENTIFIED BY '$password'"


echo "
<VirtualHost *:80>
    ServerName ${domain}
    ServerAlias www.${domain}
    ServerAdmin admin@${domain}
    DocumentRoot /var/www/html/${domain}/
    
 
    <Directory /var/www/html/${domain}>
           #Allowoverride all    ###Uncomment if required
    </Directory>

    ErrorLog    /var/www/html/${domain}/error.log
    CustomLog   /var/www/html/${domain}/requests.log combined
</VirtualHost>"  > /etc/apache2/sites-available/${domain}.conf

echo "127.0.0.1   ${domain}" >> /etc/hosts

a2ensite $domain
systemctl reload apache2