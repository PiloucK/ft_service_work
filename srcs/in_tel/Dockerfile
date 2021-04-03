FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            busybox \
            musl \
            influxdb \
            telegraf \
            wget

COPY    startup.sh .
COPY    telegraf.conf telegraf.conf.custom

RUN     mkdir -p /etc/influxdb ; \
        mkdir -p /var/lib/influxdb ; \
		chown -R influxdb:influxdb /etc/influxdb ; \
		chown -R influxdb:influxdb /var/lib/influxdb ; \
        mkdir -p /etc/telegraf ; \
        mkdir -p /var/lib/telegraf ; \
		chown -R telegraf:telegraf /etc/telegraf ; \
		chown -R telegraf:telegraf /var/lib/telegraf ; \
		chmod +x /startup.sh

# RUN     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.0_linux_amd64.tar.gz && \
#         tar xf telegraf-1.18.0_linux_amd64.tar.gz ; \
#         rm telegraf-1.18.0_linux_amd64.tar.gz

EXPOSE  8086

# CMD     sh startup.sh
