# docker-php-extensions

Pre-compiled extension for PHP at
[DockerHub](https://hub.docker.com/r/shuehchoulu/php-extensions) and
[GitHub Packages](https://github.com/evan361425/docker-php-extensions/pkgs/container/docker-php-extensions).

Exists packages:

- [gRPC](https://github.com/grpc/grpc)
- [opentelemetry](https://github.com/open-telemetry/opentelemetry-php-instrumentation)

See all compiled versions and OS in [version.json](./versions.json):

```json
{
  "8.2": { // PHP 8.2
    "grpc": { // extension name
      "latest": "1.63.0", // latest version of this extension
      // each version and it compiled OS
      "1.63.0": ["alpine-3.18", "debian-bullseye", "ubuntu-20.04"],
      "1.60.0": ["alpine-3.18", "debian-bullseye", "ubuntu-20.04"]
    }
  }
}
```

## Examples

### gRPC

gRPC required library be installed in kernel:

| OS | Lib | Example |
| -- | --- | ------- |
| Alpine | libstdc++  | [link](./examples/grpc/Dockerfile.alpine) |
| Debian | libstdc++6 | [link](./examples/grpc/Dockerfile.debian) |
| Ubuntu | libstdc++6 | [link](./examples/grpc/Dockerfile.ubuntu) |

### OpenTelemetry

```dockerfile
FROM php:8.2-cli-alpine3.18

COPY --from=shuehchoulu/php-extensions:8.2-alpine-3.18-opentelemetry-1.0.3 /opentelemetry.so /opentelemetry.so

RUN mv /opentelemetry.so $(php-config --extension-dir)/opentelemetry.so; \
    docker-php-ext-enable opentelemetry.so
```
