#!/bin/sh

influxd &
# -config etc/influxdb.conf 
sleep 2

influx << EOF
CREATE DATABASE telegraf ;
CREATE USER telegraf WITH PASSWORD 'telegraf' ;
EOF

# sleep infinity
