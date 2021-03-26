FROM    alpine:latest

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            libc6-compat
            # fontconfig

RUN     wget https://dl.grafana.com/oss/release/grafana-7.5.0.linux-amd64.tar.gz \
        && tar -zxvf grafana-7.5.0.linux-amd64.tar.gz \
        && mv grafana-7.5.0 grafana

# COPY    startup.sh .

EXPOSE  3000

# CMD     sh startup.sh
