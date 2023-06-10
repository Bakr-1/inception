FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    curl less php
RUN 	apt-get install -y php-fpm
RUN		apt-get install -y php-mysql \
    &&		apt-get install -y php-mysqli
RUN apt-get install -y mariadb-client
RUN apt-get update && apt-get upgrade -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html/wordpress
EXPOSE 9000
COPY /tools/wp.sh /tmp
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
CMD ["sh", "/tmp/wp.sh"]
