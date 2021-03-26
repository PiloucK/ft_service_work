FROM    alpine:latest

RUN     apk update \
		&& apk upgrade --available \
        && apk add --no-cache \
            influxdb

COPY    startup.sh .

EXPOSE  8086

# CMD     sh startup.sh

# FROM    alpine:latest

# RUN     apk update \
# 		&& apk upgrade --available \
#         && apk add --no-cache \
#             influxdb

# ENV     INFLUXDB_HTTP_AUTH_ENABLED=true
# ENV     INFLUXDB_ADMIN_USER=admin
# ENV     INFLUXDB_ADMIN_PASSWORD=admin

# RUN     mkdir -p /etc/influxdb ; \
#         chown influxdb:influxdb /etc/influxdb ; \
#         mkdir -p /var/lib/influxdb ; \
#         chown influxdb:influxdb /var/lib/influxdb ; \
#         mkdir -p /etc/influxdb/scripts

# COPY    startup.sh .
# COPY    influxdb.conf /etc/influxdb/influxdb.conf
# COPY    influxdb-init.iql /etc/influxdb/scripts/influxdb-init.iql

# EXPOSE  8086

# # CMD     sh startup.sh
