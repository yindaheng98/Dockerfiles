#!/bin/sh

cat > /frpc.ini << EOF
[common]
log_level = debug
EOF
echo "server_addr = ${server_addr}" >> /frpc.ini
echo "server_port = ${server_port}" >> /frpc.ini

echo "[${name}]" >> /frpc.ini
echo "type = ${type}" >> /frpc.ini
echo "local_ip = ${local_ip}" >> /frpc.ini
echo "local_port = ${local_port}" >> /frpc.ini
echo "remote_port = ${remote_port}" >> /frpc.ini
