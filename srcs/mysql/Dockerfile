FROM    alpine:latest

RUN     apk update \
		&& apk upgrade \
		&& apk --no-cache add \
            mysql \
            mysql-client

VOLUME  ['/var/lib/mysql']

COPY    startup.sh /startup.sh
COPY    my.cnf /etc/mysql/my.cnf

RUN     chmod +x /startup.sh

EXPOSE  3306

CMD     sh /startup.sh
