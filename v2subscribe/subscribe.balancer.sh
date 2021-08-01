#!/bin/sh
# $1是订阅链接
# $2是需要多少个outbound
# $3是生成配置文件的路径
PREFIX='v2gen-balance'
BALANCERS=''
for i in $(seq 1 $2); do
    UUID=$(cat /proc/sys/kernel/random/uuid)
    TEMP=/tmp/${UUID}.json
    v2gen -u "$1" -o "$TEMP" -template /etc/v2ray/templates/outbound.template.json -best
    TAG_PREFIX="$PREFIX-$i-"
    content=$(cat "$TEMP")
    eval "cat <<EOF
    $content" >"$TEMP"
    BALANCER=$(cat "$TEMP")
    rm "$TEMP"
    BALANCERS="$BALANCER,$BALANCERS"
done
SELECTORS="\"$PREFIX\","
content=$(cat /etc/v2ray/templates/balancer.template.json)
eval "cat <<EOF
$content
EOF" >"$3"
cat "$3"