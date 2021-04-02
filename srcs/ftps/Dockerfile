FROM    alpine:3.13.3

RUN     apk update \
		&& apk upgrade \
        && apk add --no-cache \
            vsftpd

COPY    startup.sh .
COPY	cert/ft_service.key /etc/ssl/private/vsftpd.key
COPY  	cert/ft_service.crt /etc/ssl/private/vsftpd.crt
COPY    vsftpd.conf /etc/vsftpd/vsftpd.conf

# RUN     useradd --system ftp
RUN     adduser ftservice ; \
        mkdir -p /etc/vsftpd/pub ; \
        chown nobody:nogroup /etc/vsftpd/pub ; \
        echo "vstpd test file" | tee /etc/vsftpd/pub/test.txt

EXPOSE  21 20 40001 40000

# CMD     sh startup.sh
