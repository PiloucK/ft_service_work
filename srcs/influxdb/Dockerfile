FROM    alpine:latest

RUN     apk update \
		&& apk upgrade --available \
        && apk add --no-cache \
            influxdb

VOLUME  [ "/var/lib/influxdb" ]

EXPOSE  8086

CMD     influxd -config etc/influxdb.conf
