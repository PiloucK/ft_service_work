#!/bin/sh

influxd &

sleep 2

influx -execute 'CREATE DATABASE telegraf'
influx -execute "CREATE USER telegraf WITH PASSWORD 'telegraf'"

wait
