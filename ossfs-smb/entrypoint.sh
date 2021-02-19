#!/bin/sh
set -e
echo $BucketName:$AccessKeyId:$AccessKeySecret > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
mkdir -p $MountPoint
ossfs hitomi-downloader $MountPoint -ourl=$EndPoint
/sbin/tini -- /usr/bin/samba.sh $@