FROM alpine AS builder
RUN apk add --no-cache \
    build-base make libarchive-dev fuse-dev git && \
    git clone https://github.com/google/fuse-archive && \
    cd fuse-archive && make

FROM alpine
RUN apk add --no-cache libarchive fuse libstdc++
COPY --from=builder fuse-archive/out/fuse-archive /usr/local/bin/archivemount
