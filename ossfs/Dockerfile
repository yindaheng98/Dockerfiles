FROM busybox AS downloader
RUN wget https://gosspublic.alicdn.com/ossfs/ossfs_1.80.6_ubuntu18.04_amd64.deb -O /ossfs.deb

FROM ubuntu:focal
COPY --from=downloader /ossfs.deb ossfs.deb
RUN apt-get update && \
    apt-get install -y gdebi-core && \
    gdebi -n ossfs.deb && \
    rm ossfs.deb && rm -rf /var/lib/apt/lists/*

ENV BucketName=your-bucket-name
ENV AccessKeyId=your-access-key-id
ENV AccessKeySecret=your-access-key-secret
ENV EndPoint=your-end-point
ENV MountDir=your-mount-dir
COPY ./mount.sh mount.sh

ENTRYPOINT [ "mount.sh" ]