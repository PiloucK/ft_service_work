FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            grafana

COPY    startup.sh .

EXPOSE  3000

CMD     sh startup.sh
