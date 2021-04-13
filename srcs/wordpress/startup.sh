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

wp --allow-root --path='/var/www/wordpress' user create Batman random@user1.com --user_pass=toto --display_name=Batman
wp --allow-root --path='/var/www/wordpress' user create Superman random@user2.com --role=author --user_pass=toto --display_name=Superman
wp --allow-root --path='/var/www/wordpress' user create WonderWoman random@user3.com --role=contributor --user_pass=toto --display_name=Wonderwoman

php-fpm7

nginx -g 'daemon off;'
