# ossfs-webdav

这是一个用ossfs挂载Aliyun OSS到本地目录并转为Webdav的镜像。基于`alpine`。

使用的ossfs版本：[https://github.com/aliyun/ossfs/tree/v1.80.6](https://github.com/aliyun/ossfs/tree/v1.80.6)

## 使用方法

```sh
docker run --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined \
 --env BucketName=your-bucket-name \
 --env AccessKeyId=your-access-key-id \
 --env AccessKeySecret=your-access-key-secret \
 --env EndPoint=your.end.point \
 --env MountPoint=/var/lib/dav \
 --env AUTH_TYPE=Digest \
 --env USERNAME=your-webdav-username \
 --env PASSWORD=your-webdav-password \
 --env OWNER_USER=www-data \
 --env OWNER_GROUP=www-data \
 --env <更多webdav相关环境变量见yindaheng98/webdav> \
 yindaheng98/ossfs:alpine
```

```yml
version: "3"
services:
  ossfs:
    image: yindaheng98/ossfs-webdav
    restart: always
    cap_add:
      - SYS_ADMIN
    devices:
      - /dev/fuse
    security_opt:
      - apparmor=unconfined
    environment:
      BucketName: your-bucket-name
      AccessKeyId: your-access-key-id
      AccessKeySecret: your-access-key-secret
      EndPoint: your.end.point
      AUTH_TYPE: Digest
      USERNAME: your-webdav-username
      PASSWORD: your-webdav-password
      OWNER_USER: www-data
      OWNER_GROUP: www-data
```
