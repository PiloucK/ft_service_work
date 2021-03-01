FROM	alpine

RUN     apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y \
			nginx

COPY	srcs/myserv_index_on.conf .
COPY	srcs/myserv_index_off.conf .
COPY	srcs/switch_index.sh .
RUN		cp myserv_index_on.conf /etc/nginx/sites-enabled/myserv.conf \
		&& rm -rf /etc/nginx/sites-enabled/default

EXPOSE  80 443
