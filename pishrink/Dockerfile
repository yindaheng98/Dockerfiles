FROM ubuntu:focal AS downloader
ARG VERSION=1.7.5
WORKDIR /
RUN apt-get update && apt-get install -y git && \
    git clone https://github.com/Drewsif/PiShrink

FROM ubuntu:focal
COPY --from=downloader /PiShrink/pishrink.sh /pishrink.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /pishrink.sh && \
    chmod +x /entrypoint.sh && \
    apt-get update && \
    apt-get install -y parted udev && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "/entrypoint.sh" ]