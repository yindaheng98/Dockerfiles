#!/bin/bash
set -e
echo $BucketName:$AccessKeyId:$AccessKeySecret > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
mkdir -p $MountDir
ossfs hitomi-downloader $MountDir -ourl=$EndPoint
exec "$@"