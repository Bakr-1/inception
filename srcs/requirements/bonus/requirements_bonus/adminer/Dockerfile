FROM debian:buster
RUN apt -y update 
COPY ./tools/script.sh /
RUN apt install wget -y && apt install php php-mysql  -y
RUN \
	mkdir -p /var/www/html && \
	wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 
	chown -R www-data:www-data /var/www/html/adminer.php 
	chmod 755 /var/www/html/adminer.php
	adduser -u 82 -D -S -G www-data www-data
EXPOSE 9000
WORKDIR /var/www/html
RUN rm -rf index.html
STOPSIGNAL SIGQUIT
CMD ["php", "-S", "0.0.0.0:80"]