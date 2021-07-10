#!/bin/bash
CRONTAB=''
MSG=''
while read VAR; do
    CRON_COMMAND_KEY="${VAR#*CRON_COMMAND}"
    CRON_COMMAND_VAR=CRON_COMMAND$CRON_COMMAND_KEY
    CRON_RUNTIME_VAR=CRON_RUNTIME$CRON_COMMAND_KEY
    CRON_COMMAND_VAL=${!CRON_COMMAND_VAR}
    CRON_RUNTIME_VAL=${!CRON_RUNTIME_VAR}
    CRON_COMMAND_VAL=${CRON_COMMAND_VAL:-$DEFAULT_CRON_COMMAND}
    CRON_RUNTIME_VAL=${CRON_RUNTIME_VAL:-$DEFAULT_CRON_RUNTIME}
    CRON="$CRON_RUNTIME_VAL bash -c \"$CRON_COMMAND_VAL\" > /proc/\$(cat /var/run/crond.pid)/fd/1 2>&1"
    echo "a cron job in $CRON_COMMAND_VAR has detected: $CRON"
    CRONTAB=$CRONTAB$'\n'$CRON
done <<<$(compgen -A variable | grep '^CRON_COMMAND_')
echo "so your crontab is: "
echo "$CRONTAB"
echo "$CRONTAB" | crontab -
exec "$@"
