#!/bin/bash

mysql_install_db

mysqld_safe &

sleep 2

mysql -u root << EOF
CREATE USER 'ftservice'@'%' IDENTIFIED BY 'ftservice';
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'ftservice'@'%';
FLUSH PRIVILEGES;
EOF

wait
