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

COPY		cert/dh2048.pem /etc/ssl/nginx/dh2048.pem
COPY		cert/ft_service.key /etc/nginx/ft_service.key
COPY  		cert/ft_service.crt /etc/nginx/ft_service.crt
COPY		startup.sh .

ADD			https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN			wget http://wordpress.org/latest.tar.gz && \
			tar -xzvf latest.tar.gz && \
			rm latest.tar.gz ; \
			mv wordpress /var/www

COPY		wp-config.php /var/www/wordpress/wp-config.php

RUN			mkdir -p /etc/ssl/nginx ; \
			mkdir -p /var/run/nginx ; \
			adduser -D -g 'www' www ; \
			chown -R www:www /var/lib/nginx ; \
			chown -R www:www /var/www/wordpress ; \
			chmod -R 755 /var/www/wordpress ; \
			chmod +x /usr/local/bin/wp ; \
			chmod +x startup.sh

COPY        nginx.conf /etc/nginx/

EXPOSE      5050

CMD			nginx -g 'daemon off;'
# CMD			sh startup.sh
