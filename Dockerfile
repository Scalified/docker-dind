FROM debian:trixie-slim

LABEL maintainer="Scalified <scalified@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
        ca-certificates \
        curl \
        cron \
        wget \
        git \
        gnupg \
        lsb-release \
        libicu76 \
        supervisor && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update && \
    apt install -y --no-install-recommends \
        docker-ce \
        docker-buildx-plugin \
        docker-compose-plugin && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY rootfs /

ENTRYPOINT ["/usr/local/bin/entrypoint"]
