#!/bin/sh
CRON="$CRON_RUNTIME bash -c \"$CRON_COMMAND\" > /proc/\$(cat /var/run/crond.pid)/fd/1 2>&1"
echo "$CRON" | crontab -
echo "a cron job has set: $CRON"
exec "$@"