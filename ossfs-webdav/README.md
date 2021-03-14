# ossfs

这是一个用ossfs挂载Aliyun OSS到本地目录的镜像。包含基于`ubuntu`和`alpine`的两个版本。

使用的ossfs版本：[https://github.com/aliyun/ossfs/tree/v1.80.6](https://github.com/aliyun/ossfs/tree/v1.80.6)

基于此镜像可以制作很多其他镜像。

## 使用方法

ubuntu版本：

```sh
docker run --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined \
 --env BucketName=your-bucket-name \
 --env AccessKeyId=your-access-key-id \
 --env AccessKeySecret=your-access-key-secret \
 --env EndPoint=your.end.point \
 --env MountPoint=/your/mount/dir \
 yindaheng98/ossfs:ubuntu your-command
```

alpine版本：

```sh
docker run --cap-add SYS_ADMIN --device /dev/fuse --security-opt apparmor=unconfined \
 --env BucketName=your-bucket-name \
 --env AccessKeyId=your-access-key-id \
 --env AccessKeySecret=your-access-key-secret \
 --env EndPoint=your.end.point \
 --env MountPoint=/your/mount/dir \
 yindaheng98/ossfs:alpine your-command
```
