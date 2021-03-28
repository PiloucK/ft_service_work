FROM  alpine:latest

RUN         apk update \
		&& apk upgrade \
		&& apk --no-cache add \
			curl \
			nginx \
			php \
			php-cli \
			php-curl \
			php-fpm \
			php-gd \
			php-intl \
			php-mbstring \
			php-mysqli \
			wget

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
			chmod -R 755 /www/wordpress

COPY		cert/dh2048.pem /etc/ssl/nginx/dh2048.pem
COPY		cert/ft_service.key /etc/nginx/ft_service.key
COPY  		cert/ft_service.crt /etc/nginx/ft_service.crt
COPY		wp-config.php /www/wordpress/wp-config.php

COPY        nginx.conf /etc/nginx/

EXPOSE      5050

CMD			php-fpm7 ; \
			nginx -g 'daemon off;'
