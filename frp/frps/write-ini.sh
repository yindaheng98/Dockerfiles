#!/bin/sh

cat > /frps.ini << EOF
[common]
bind_port = 7000

# set dashboard_addr and dashboard_port to view dashboard of frps
# dashboard_addr's default value is same with bind_addr
# dashboard is available only if dashboard_port is set
dashboard_addr = 0.0.0.0
dashboard_port = 7500

# dashboard user and passwd for basic auth protect, if not set, both default value is admin
EOF

echo "dashboard_user = ${dashboard_user}" >> /frps.ini
echo "dashboard_pwd = ${dashboard_pwd}" >> /frps.ini
exec "$@"
