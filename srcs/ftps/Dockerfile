FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            vsftpd

COPY    startup.sh .
COPY	cert/ft_service.key /etc/ssl/private/vsftpd.key
COPY  	cert/ft_service.crt /etc/ssl/private/vsftpd.crt
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN     mkdir -p /ftservice/vsftpd/pub/upload ; \
        chown -R nobody:nogroup /ftservice/vsftpd ; \
        chmod 755 /ftservice/vsftpd/pub ; \
        chmod -R 0777 /ftservice/vsftpd/pub/upload ; \
        chown ftp:ftp /etc/ssl/private/vsftpd.key ; \
        chown ftp:ftp /etc/ssl/private/vsftpd.crt ; \
        echo "vstpd test file" | tee /ftservice/vsftpd/pub/test.txt

EXPOSE  21 20 40000-40004

CMD     sh startup.sh
