FROM alpine:3 AS builder
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev && \
    git clone -b v1.80.6 https://github.com/aliyun/ossfs.git && \
    cd ossfs && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

FROM dperson/samba
RUN apk --update add fuse curl libxml2 openssl libstdc++ libgcc && rm -rf /var/cache/apk/* 
COPY --from=builder /usr/local/bin/ossfs /usr/local/bin/ossfs
ENV BucketName=your-bucket-name
ENV AccessKeyId=your-access-key-id
ENV AccessKeySecret=your-access-key-secret
ENV EndPoint=your-end-point
ENV MountPoint=/mount
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]