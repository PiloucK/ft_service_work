FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
		&& apk --no-cache add \
			fcgi \
            nginx \
            php7-common php7-session php7-gd php7-xml php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
            php7 \
            php7-curl \
            php7-fpm \
            php7-iconv \
            php7-json \
            php7-mbstring \
            php7-openssl \
            php7-phar \
            php7-zip \
            wget

ENV         PMA_ABSOLUTE_URI=https://phpmyadmin-service/phpmyadmin

COPY		cert/dh2048.pem /etc/ssl/nginx/dh2048.pem
COPY		cert/ft_service.key /etc/nginx/ft_service.key
COPY  		cert/ft_service.crt /etc/nginx/ft_service.crt
COPY		startup.sh .

RUN			wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz && \
			tar -xzvf phpMyAdmin-latest-english.tar.gz --directory /var/www && \
			rm phpMyAdmin-latest-english.tar.gz ; \
            mv /var/www/php* /var/www/phpmyadmin

COPY		config.inc.php /var/www/phpmyadmin/config.inc.php

RUN			mkdir -p /etc/ssl/nginx ; \
			mkdir -p /var/run/nginx ; \
			adduser -D -g 'www' www ; \
			chown -R www:www /var/lib/nginx ; \
			chown -R www:www /var/www/phpmyadmin ; \
			chmod -R 755 /var/www/phpmyadmin ; \
			chmod +x startup.sh

COPY        __/nginx.conf /etc/nginx/nginx.conf

EXPOSE      5000

CMD			sh startup.sh
