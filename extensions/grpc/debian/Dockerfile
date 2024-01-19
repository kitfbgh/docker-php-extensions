ARG OS_VERSION=bullseye
ARG PHP_VERSION=8.2

FROM php:${PHP_VERSION}-cli-${OS_VERSION} AS builder

ARG VERSION=1.60.0

# Unpack source
RUN docker-php-source extract

# Download
RUN mkdir -p /usr/src/php/ext/grpc && \
      apt-get update && \
      apt-get install -y --no-install-recommends \
            wget \
            zlib1g-dev \
            binutils && \
      wget -O /tmp/grpc.tgz https://pecl.php.net/get/grpc-${VERSION}.tgz && \
      tar -C /usr/src/php/ext/grpc -xf /tmp/grpc.tgz --strip-components=1 && \
      rm -rf /var/lib/apt/lists/*

# Install
RUN docker-php-ext-install --jobs $(nproc) grpc

FROM scratch

COPY --from=builder /usr/local/lib/php/extensions/no-debug-non-zts-*/grpc.so /grpc.so
