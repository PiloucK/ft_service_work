#!/bin/bash

mysql_install_db -user=mysql --datadir=/var/lib/mysql

mysqld_safe
