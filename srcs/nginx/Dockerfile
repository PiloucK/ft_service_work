FROM	alpine:latest

RUN     apk update \
		&& apk upgrade \
		&& apk --no-cache add \
			nginx \
			openssl

RUN		rm /etc/nginx/nginx.conf ; \
		mkdir -p /etc/ssl/nginx ; \
		mkdir -p /var/run/nginx

RUN		openssl dhparam -out /etc/ssl/nginx/dh2048.pem 2048
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ft_service.key -out /etc/nginx/ft_service.crt -subj "/C=FR/ST=IDE/L=Paris/O=42/OU=42/CN=ft_service.com"

COPY	nginx.conf /etc/nginx/
# COPY	index.html	/www/

EXPOSE  80 443

CMD		nginx -g 'daemon off;'
