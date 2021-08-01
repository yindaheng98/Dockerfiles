#!/bin/sh
# $1是订阅链接
# $2是生成配置文件的路径
v2gen -u "$1" -o "$2" -template /etc/v2ray/templates/outbound.template.json -best -thread $THREAD -c $COUNT
cat "$2"