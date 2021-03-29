#!/bin/bash

while true; do
    wp core install \
        --allow-root \
        --path='/var/www/wordpress' \
        --url="192.168.49.2:5050" \
        --title=WordPress \
        --admin_user=ftservice \
        --admin_password=ftservice \
        --admin_email="admin@admin.com" && break;
done;

wp user create random_user random@user.com --user_pass=toto --display_name=Batman
wp user create random_author random@user.com --role=author --user_pass=toto --display_name=Superman
wp user create random_author random@user.com --role=contributor --user_pass=toto --display_name=Wonderwoman

php-fpm7

nginx -g 'daemon off;'
