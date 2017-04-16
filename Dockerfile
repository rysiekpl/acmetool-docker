FROM busybox:latest
MAINTAINER Hubert Dąbrowski <h@dabrow.org>

ENV ACME_STATE_DIR="/data"
ARG VERSION="0.0.59"

ADD https://github.com/hlandau/acme/releases/download/v${VERSION}/acmetool-v${VERSION}-linux_amd64.tar.gz /opt/
RUN tar -xf /opt/acmetool-v${VERSION}-linux_amd64.tar.gz -C /opt && \
    rm /opt/acmetool-v${VERSION}-linux_amd64.tar.gz && \
    mv /opt/acmetool-v${VERSION}-linux_amd64 /opt/acmetool

VOLUME ["/data"]

ENTRYPOINT ["/opt/acmetool/bin/acmetool"]
CMD ["--help"]
