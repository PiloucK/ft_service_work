FROM	alpine:latest

RUN     apk update \
		&& apk upgrade \
		&& apk --no-cache add \
			nginx \
			openssl

RUN		mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig ; \
		mkdir /etc/ssl/nginx ; \
		mkdir /var/run/nginx

RUN		openssl dhparam -out /etc/ssl/nginx/dh4096.pem 4096

COPY	srcs/nginx.conf /etc/nginx/

EXPOSE  80 443

# CMD		nginx -g 'pid /tmp/nginx.pid;' \
# 		&& nginx -g 'daemon off;'
