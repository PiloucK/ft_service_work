#!/bin/bash

mysql_install_db --datadir=/var/lib/mysql

mysqld_safe
