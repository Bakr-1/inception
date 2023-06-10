FROM debian:buster

ARG DEBIAN_FRONTEND="noninteractive"
ARG DEBCONF_NOWARNINGS="yes"

ARG FTP_USER
ARG FTP_PASS

RUN apt-get update && \
    apt-get install --yes vsftpd

RUN adduser "${FTP_USER}" --disabled-password && \
	echo "${FTP_USER}:${FTP_PASS}" | chpasswd && \
	mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN echo "${FTP_USER}" >> /etc/vsftpd.userlist

WORKDIR /var/www/html

CMD ["vsftpd", "/etc/vsftpd.conf"]
