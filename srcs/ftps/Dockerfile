FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            vsftpd

COPY    startup.sh .
COPY	cert/ft_service.key /etc/ssl/private/vsftpd.key
COPY  	cert/ft_service.crt /etc/ssl/private/vsftpd.crt
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN     mkdir -p /ftservice/vsftpd ; \
        mkdir -p /ftservice/vsftpd/pub ; \
        mkdir -p /ftservice/vsftpd/empty ; \
        chown -R nobody:nogroup /ftservice/vsftpd ; \
        chmod -R 755 /ftservice/vsftpd ; \
        echo "vstpd test file" | tee /ftservice/vsftpd/pub/test.txt

EXPOSE  21 20 40001 40000

# CMD     sh startup.sh
