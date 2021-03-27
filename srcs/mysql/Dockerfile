FROM	alpine:latest

RUN	apk update \
	&& apk upgrade \
	&& apk --no-cache add \
		mariadb \
		mariadb-client \
		openrc

COPY		my.cnf /etc/mysql/my.cnf
COPY		startup.sh startup.sh

# RUN		sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf ; \
# 		sed -i "s/#bind-address=/bind-address=/" /etc/my.cnf.d/mariadb-server.cnf ; \
RUN		mkdir -p /run/mysqld ; \
		chown mysql:mysql /var/lib/mysql ; \
		chown mysql:mysql /run/mysqld ; \
		chmod +x /startup.sh

EXPOSE	3306

# CMD     sh /startup.sh
