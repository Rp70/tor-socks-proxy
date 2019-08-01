FROM tor-socks-proxy:single

LABEL maintainer="github.com/Rp70"
LABEL name="tor-socks-proxy:multiple"
LABEL version="latest"

RUN set -ex && \
    #apk -U upgrade && \
    apk -v add supervisor && \
    rm -rf /var/cache/apk/*

ADD /files/ /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["startup"]
