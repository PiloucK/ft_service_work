FROM	alpine:latest

RUN     apk update \
		&& apk upgrade \
		&& apk --no-cache add \
			nginx

RUN		rm /etc/nginx/nginx.conf ; \
		mkdir -p /etc/ssl/nginx ; \
		mkdir -p /var/run/nginx ; \
		adduser -D -g 'www' www ; \
		mkdir -p /www ; \
		chown -R www:www /var/lib/nginx ; \
		chown -R www:www /www

COPY	cert/dh2048.pem /etc/ssl/nginx/dh2048.pem
COPY	cert/ft_service.key /etc/nginx/ft_service.key
COPY	cert/ft_service.crt /etc/nginx/ft_service.crt
COPY	nginx.conf /etc/nginx/
COPY	index.html	/www/

EXPOSE  80 443

CMD		nginx -g 'daemon off;'
