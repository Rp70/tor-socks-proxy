# This argument BASEIMAGE mainly used to bypass Docker Hub auto build process which doesn't allow to specify a build argument.
ARG BASEIMAGE=rp70/tor-socks-proxy:single
FROM $BASEIMAGE

LABEL maintainer="github.com/Rp70"
LABEL name="tor-socks-proxy:multiple"
LABEL version="latest"

RUN set -ex && \
    #apk -U upgrade && \
    apk -v add supervisor && \
    rm -rf /var/cache/apk/*

ADD /files/ /

RUN set -ex && \
    chmod 0755 /docker-entrypoint.sh && \
    ls -lah 

HEALTHCHECK NONE
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["startup"]
