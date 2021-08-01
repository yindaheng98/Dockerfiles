#!/bin/sh
# $1是订阅链接
# $2是生成配置文件的路径
# $3是需要多少个outbound
# $4是在前多少个outbound里面选
PREFIX='v2gen-balance'
BALANCERS=''
SELECT=0
for i in $(seq 1 $3); do
    UUID=$(cat /proc/sys/kernel/random/uuid)
    TEMP=/tmp/${UUID}.json
    expect << EOF
    set timeout -1
    spawn v2gen -u "$1" -o $TEMP -template /etc/v2ray/templates/outbound.template.json -thread $THREAD -c $COUNT
    expect "Please Select:"
    send "$(expr $RANDOM % $4)\n"
    expect "config has been written to"
EOF
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
EOF" >"$2"
cat "$2"
