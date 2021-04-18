# ossfs-nextcloud

在nextcloud容器中用ossfs挂载Aliyun OSS到`/var/www/html`。基于`nextcloud:20`。

使用的ossfs版本：[https://github.com/aliyun/ossfs/tree/v1.80.6](https://github.com/aliyun/ossfs/tree/v1.80.6)

## 使用方法

```sh
docker run --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined \
 --env BucketName=your-bucket-name \
 --env AccessKeyId=your-access-key-id \
 --env AccessKeySecret=your-access-key-secret \
 --env EndPoint=your.end.point \
 --env MountPoint=/var/www/html \
 --env OWNER_USER=www-data \
 --env OWNER_GROUP=www-data \
 yindaheng98/ossfs-nextcloud
```

```yml
version: "3"
services:
  ossfs:
    image: yindaheng98/ossfs-nextcloud
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
      MountPoint: /var/www/html
      OWNER_USER: www-data
      OWNER_GROUP: www-data
```
