FROM alpine:3 AS builder
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev && \
    git clone -b v1.80.6 https://github.com/aliyun/ossfs.git && \
    cd ossfs && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

FROM alpine:3
RUN apk --update add fuse curl libxml2 openssl libstdc++ libgcc && rm -rf /var/cache/apk/* 
COPY --from=builder /usr/local/bin/ossfs /usr/local/bin/ossfs
ENV BucketName=your-bucket-name
ENV AccessKeyId=your-access-key-id
ENV AccessKeySecret=your-access-key-secret
ENV EndPoint=your-end-point
ENV MountPoint=your-mount-dir
COPY ./mount.sh /mount.sh

ENTRYPOINT [ "/mount.sh" ]