ARG OS_VERSION=20.04

FROM ubuntu:${OS_VERSION} AS builder

ARG PHP_VERSION=8.2
ARG VERSION=1.60.0

# Download
RUN apt update && apt install -y software-properties-common && add-apt-repository -y ppa:ondrej/php
RUN apt-get install -y --no-install-recommends \
    php${PHP_VERSION} \
    php-dev \
    php-pear \
    autoconf \
    zlib1g-dev \
    make \
    g++

# Install
RUN MAKEFLAGS="-j $(nproc)" pecl install grpc-${VERSION}

FROM scratch

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-*/grpc.so /grpc.so
