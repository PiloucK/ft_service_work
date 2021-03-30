#!/bin/bash

mysql_install_db --user=mysql --datadir=/var/lib/mysql --basedir=/usr

mysqld_safe --datadir=/var/lib/mysql &

sleep 2

mysql -u root << EOF
CREATE USER 'ftservice'@'%' IDENTIFIED BY 'ftservice';
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'ftservice'@'%' IDENTIFIED BY 'ftservice';
FLUSH PRIVILEGES;
EOF

wait
