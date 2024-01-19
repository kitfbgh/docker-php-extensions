# docker-php-extensions

Pre-compiled extension for PHP at [DockerHub](https://hub.docker.com/r/shuehchoulu/php-extensions).

Image tags naming pattern are:

```bash
${PHP_VERSION}-${OS}-${OS_VERSION}-${EXTENSION_NAME}-${EXTENSION_VERSION}
```

| tag | php ver. | os | os ver. | ext. | ext. ver. |
| --- | -------- | -- | ------- | ---- | --------- |
| 8.2-alpine-3.18-grpc-1.60.0     | 8.2 | alpine | 3.18     | grpc | 1.60.0 |
| 8.1-debian-bullseye-grpc-1.59.0 | 8.1 | debian | bullseye | grpc | 1.59.0 |
| 8.0-ubuntu-20.04-grpc-1.58.0    | 8.0 | ubuntu | 20.04    | grpc | 1.58.0 |

Exists packages:

-   [grpc](#grpc)

## GRPC

Required library:

| OS | Lib | Example |
| -- | --- | ------- |
| Alpine | libstdc++  | [link](./examples/grpc/Dockerfile.alpine) |
| Debian | libstdc++6 | [link](./examples/grpc/Dockerfile.debian) |
| Ubuntu | libstdc++6 | [link](./examples/grpc/Dockerfile.ubuntu) |
