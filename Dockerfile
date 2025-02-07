FROM debian:bullseye-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
    perl-modules \
    liburi-encode-perl \
    gnupg \
    wget \
    texlive-full

ENV HOME=/tmp

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
