FROM ubuntu:focal

RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/*
ENV DEFAULT_CRON_RUNTIME='* * * * *'
ENV DEFAULT_CRON_COMMAND="echo it\'s \\$(date) now, I\'m a little cron job."
COPY init.sh /init.sh

ENTRYPOINT [ "/init.sh" ]
CMD [ "cron", "-f" ]