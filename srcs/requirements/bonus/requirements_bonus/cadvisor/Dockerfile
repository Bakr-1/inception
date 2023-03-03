FROM debian:buster

ARG DEBIAN_FRONTEND="noninteractive"
ARG DEBCONF_NOWARNINGS="yes"

RUN apt-get update && \
    apt-get install --yes wget

RUN wget --directory-prefix=/tmp/ \
    https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 \
    --output-document=cadvisor && \
    chmod +x cadvisor

CMD ["./cadvisor"]