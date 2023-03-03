FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    curl less php

# INSTALL PHP-FPM (FastCgi process manager)
	# protocol that define how my web server (nginx) communicates
	# with my CGI programm (php) about the received request
RUN 	apt-get install -y php-fpm

# Install MYSQL (old db driver)
# Install MYSQLI (new driver)
RUN		apt-get install -y php-mysql \
    &&		apt-get install -y php-mysqli

RUN apt-get install -y mariadb-client

RUN apt-get update && apt-get upgrade -y

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Install WORDPRESS
RUN mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY /tools/wp.sh /tmp

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/wp.sh"]
