FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            busybox \
            musl \
            grafana

COPY    startup.sh .
COPY    __/grafana.db /usr/share/grafana/data/grafana.db

EXPOSE  3000

CMD     sh startup.sh
