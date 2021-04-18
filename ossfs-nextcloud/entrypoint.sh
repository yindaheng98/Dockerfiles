#!/bin/sh
echo $BucketName:$AccessKeyId:$AccessKeySecret > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
mkdir -p $MountPoint
ossfs $BucketName $MountPoint -ourl=$EndPoint -o allow_other -ouid=$(id $OWNER_USER -u) -ogid=$(id $OWNER_GROUP -g)
exec "$@"