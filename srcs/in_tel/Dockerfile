FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            busybox \
            musl \
            influxdb \
            telegraf

COPY    startup.sh .

RUN     useradd -rs /bin/false influxdb ; \
        mkdir -p /etc/influxdb ; \
        mkdir -p /var/lib/influxdb ; \
		chown -R influxdb:influxdb /etc/influxdb ; \
		chown -R influxdb:influxdb /var/lib/influxdb ; \
        useradd -rs /bin/false telegraf ; \
        mkdir -p /etc/telegraf ; \
        mkdir -p /var/lib/telegraf ; \
		chown -R telegraf:telegraf /etc/telegraf ; \
		chown -R telegraf:telegraf /var/lib/telegraf ; \
		chmod +x /startup.sh

EXPOSE  8086

CMD     sh startup.sh
