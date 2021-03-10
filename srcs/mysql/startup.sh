#!/bin/bash

/usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql

/usr/bin/mysqld_safe
