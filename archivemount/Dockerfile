FROM alpine AS builder
ENV REPO=https://github.com/fatedier/frp
ARG VERSION=v0.34.3
RUN apk add --no-cache --no-cache \
    autoconf automake g++ make libarchive-dev fuse-dev git && \
    git clone https://github.com/cybernoid/archivemount && \
    cd archivemount && autoreconf -i && \
    ./configure && make && make install

FROM alpine
RUN apk add --no-cache --no-cache libarchive fuse
COPY --from=builder /usr/local/bin/archivemount /usr/local/bin/archivemount