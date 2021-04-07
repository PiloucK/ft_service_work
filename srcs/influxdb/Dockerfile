FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            busybox \
            musl \
            influxdb \
            wget

COPY    startup.sh .

RUN     mkdir -p /etc/influxdb ; \
        mkdir -p /var/lib/influxdb ; \
		chown -R influxdb:influxdb /etc/influxdb ; \
		chown -R influxdb:influxdb /var/lib/influxdb ; \
		chmod +x /startup.sh

EXPOSE  8086

CMD     sh startup.sh
