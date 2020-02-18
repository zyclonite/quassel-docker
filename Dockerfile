FROM alpine:3.11

LABEL maintainer "zyclonite"
LABEL version "0.13.1"
LABEL description "Quassel-Core as Docker Image"

ARG version="0.13.1-r3"

RUN apk add --no-cache --purge --clean-protected -u ca-certificates quassel-core=$version \
 && rm -rf /var/cache/apk/*

VOLUME /var/lib/quassel

EXPOSE 4242

ENTRYPOINT [ "/usr/bin/quasselcore" ]
CMD [ "--configdir", "/var/lib/quassel", "--logfile", "/dev/stdout", "--port", "4242" ]
