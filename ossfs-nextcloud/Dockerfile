FROM nextcloud:stable AS builder
RUN apt-get update && \
    apt-get install -y automake autotools-dev g++ git libcurl4-gnutls-dev \
    libfuse-dev libssl-dev libxml2-dev make pkg-config && \
    git clone -b v1.80.6 https://github.com/aliyun/ossfs.git && \
    cd ossfs && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

FROM nextcloud:20
COPY ./entrypoint.sh /ossfs-entrypoint.sh
RUN chmod a+x /ossfs-entrypoint.sh && \
    apt-get update && \
    apt-get install -y libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev && \
    rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/bin/ossfs /usr/local/bin/ossfs
ENV BucketName=your-bucket-name
ENV AccessKeyId=your-access-key-id
ENV AccessKeySecret=your-access-key-secret
ENV EndPoint=your-end-point
ENV MountPoint=/var/www/html
ENV OWNER_USER=root
ENV OWNER_GROUP=root
ENTRYPOINT ["/ossfs-entrypoint.sh","/entrypoint.sh"]
CMD ["apache2-foreground"]