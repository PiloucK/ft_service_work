#!/bin/bash

mysql_install_db --user=root --datadir=/var/lib/mysql

mysqld_safe
