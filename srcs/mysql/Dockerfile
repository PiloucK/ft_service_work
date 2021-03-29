FROM	alpine:3.13.3

RUN	apk update \
	&& apk upgrade \
	&& apk --no-cache add \
		mariadb \
		mariadb-client

COPY		mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY		startup.sh startup.sh

RUN		mkdir -p /run/mysqld ; \
            mkdir -p /var/lib/mysql ; \
		chown -R mysql:mysql /var/lib/mysql ; \
		chown -R mysql:mysql /run/mysqld ; \
            chmod -R 755 /var/lib/mysql ; \
		chmod +x /startup.sh

EXPOSE	3306

CMD     sh /startup.sh
