FROM ubuntu:focal

COPY init.sh /init.sh
RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/* && chmod +x /init.sh
ENV DEFAULT_CRON_RUNTIME='* * * * *'
ENV DEFAULT_CRON_COMMAND="echo it\'s \\$(date) now, I\'m a little cron job."

ENTRYPOINT [ "/init.sh" ]
CMD [ "cron", "-f" ]