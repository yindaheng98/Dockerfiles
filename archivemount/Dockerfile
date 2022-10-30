FROM alpine AS builder
RUN apk add --no-cache \
    autoconf automake build-base make libarchive-dev fuse-dev git && \
    git clone https://github.com/google/fuse-archive && \
    cd fuse-archive && make

FROM alpine
RUN apk add --no-cache libarchive fuse libstdc++ libgcc
COPY --from=builder fuse-archive/out/fuse-archive /usr/local/bin/archivemount