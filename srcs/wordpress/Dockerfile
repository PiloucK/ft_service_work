FROM  alpine:latest

RUN         apk update \
		&& apk upgrade \
		&& apk --no-cache add \
			fcgi \
			mysql-client \
			nginx \
			php \
			php-cli \
			php-curl \
			php-phar \
			php-fpm \
			php-gd \
			php-intl \
			php-mbstring \
			php-mysqli \
			php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
			wget

ADD			https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN         rm /etc/nginx/nginx.conf ; \
			mkdir -p /etc/ssl/nginx ; \
			mkdir -p /var/run/nginx ; \
			adduser -D -g 'www' www ; \
			mkdir -p /www ; \
			chown -R www:www /var/lib/nginx ; \
			chown -R www:www /www ; \
			wget http://wordpress.org/latest.tar.gz && \
			tar -xzvf latest.tar.gz && \
			rm latest.tar.gz ; \
			mv wordpress /www/wordpress ; \
			chmod -R 755 /www/wordpress ; \
			chmod -R 755 /usr/local/bin/wp

COPY		cert/dh2048.pem /etc/ssl/nginx/dh2048.pem
COPY		cert/ft_service.key /etc/nginx/ft_service.key
COPY  		cert/ft_service.crt /etc/nginx/ft_service.crt
COPY		wp-config.php /www/wordpress/wp-config.php

COPY        nginx.conf /etc/nginx/

EXPOSE      5050

# CMD			php-fpm7 ; \
# 			nginx -g 'daemon off;'
