FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

# generate self-signed certificates

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
 -out /etc/ssl/nginx-selfsigned.crt -subj "/CN=aalseri.42.fr/O=42AD/L=Abu Dhabi/ST=Abu Dhabi/C=AE"

# copy the certificates and nginx configuration
COPY /conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf


# configure nginx to only support tlsv1.2 or tlsv1.3
RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/' /etc/nginx/sites-enabled/nginx.conf

EXPOSE 443

#ensure that processes are properly cleaned up and terminated 
# when the container is stopped or restarted. This can help to 
# avoid issues with orphaned processes or zombie processes that 
# can cause problems if they are left running.
RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# The daemon off directive tells Nginx to stay in the foreground
CMD ["nginx", "-g", "daemon off;"]