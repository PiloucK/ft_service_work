FROM    alpine:latest

RUN     apk update \
		&& apk upgrade --available \
        && apk add \
            influxdb

VOLUME  [ "/var/lib/influxdb" ]

EXPOSE  8086

CMD     influxd
