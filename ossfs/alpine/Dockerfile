FROM alpine:3 AS builder
RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev && \
    git clone -b v1.80.6 https://github.com/aliyun/ossfs.git && \
    cd ossfs && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

FROM alpine:3
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh && \
    apk --update add fuse curl libxml2 openssl libstdc++ libgcc && \
    rm -rf /var/cache/apk/* 
COPY --from=builder /usr/local/bin/ossfs /usr/local/bin/ossfs
ENV BucketName=your-bucket-name
ENV AccessKeyId=your-access-key-id
ENV AccessKeySecret=your-access-key-secret
ENV EndPoint=your-end-point
ENV MountPoint=/var/lib/dav/data
ENV OWNER_USER=root
ENV OWNER_GROUP=root

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "ls", "${MountPoint}" ]