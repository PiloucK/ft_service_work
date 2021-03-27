#!/bin/sh

influxd -config etc/influxdb.conf &

sleep 2

influx << EOF
CREATE USER influxdb WITH PASSWORD '' WITH ALL PRIVILEGES ;
CREATE DATABASE ftservice ;
EOF

sleep infinity
