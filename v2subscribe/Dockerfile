FROM yindaheng98/v2gen AS v2gen
FROM v2fly/v2fly-core
COPY --from=v2gen /bin/v2gen /bin/v2gen
COPY subscribe.outbound.sh /bin/subscribe.outbound.sh
COPY subscribe.balancer.sh /bin/subscribe.balancer.sh
COPY templates /etc/v2ray/templates