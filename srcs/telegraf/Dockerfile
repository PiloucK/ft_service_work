FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            busybox \
            musl \
            telegraf \
            wget

COPY    startup.sh .
COPY    toto.conf etc/telegraf/telegraf.conf

RUN     mkdir -p /etc/telegraf ; \
        mkdir -p /var/lib/telegraf ; \
		chown -R telegraf:telegraf /etc/telegraf ; \
		chown -R telegraf:telegraf /var/lib/telegraf ; \
		chmod +x /startup.sh

EXPOSE  8086

CMD     sh startup.sh
