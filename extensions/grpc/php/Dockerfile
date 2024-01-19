ARG BASE_TAG=8.2-cli-alpine3.19

FROM php:${BASE_TAG} AS builder

ARG VERSION=1.60.0

# Unpack source
RUN docker-php-source extract

# Download
RUN mkdir /usr/src/php/ext/grpc; \
      wget -O /tmp/grpc.tgz https://pecl.php.net/get/grpc-${VERSION}.tgz; \
      tar -C /usr/src/php/ext/grpc -xzf /tmp/grpc.tgz --strip-components 1; \
      apk add --update --no-cache --virtual .build-deps \
            zlib-dev \
            linux-headers \
            binutils

# Install
RUN docker-php-ext-install --jobs $(nproc) grpc

FROM scratch

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-*/grpc.so /grpc.so
