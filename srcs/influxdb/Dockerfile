FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            busybox \
            musl \
            influxdb \
            telegraf

COPY    startup.sh .

EXPOSE  8086

# CMD     sh startup.sh
