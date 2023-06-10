FROM    alpine:3.15

WORKDIR /var/hugo/static

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            shadow \
 &&     rm -f /var/cache/apk/*

RUN hugo new site /var/hugo/static \
 	&&     cd /var/hugo/static \
 	&&     git clone https://github.com/vaga/hugo-theme-m10c themes/m10c \
 	&&     hugo new posts/presentation.md \
 	&&     hugo -b https://aalseri.42.fr/static \
	&& mkdir -p /var/hugo/me/content/about

COPY    ./conf/config.toml        /var/hugo/static/config.toml
COPY    ./conf/presentaion.md    /var/hugo/static/content/posts/presentaion.md
COPY    ./conf/about.md           /var/hugo/static/content/about/index.md
COPY	./conf/tt-1.png		/var/hugo/static/themes/m10c/static/tt-1.png
COPY    ./conf/tt.png         /var/hugo/static/themes/m10c/static/tt.png

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://aalseri.42.fr/static", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]