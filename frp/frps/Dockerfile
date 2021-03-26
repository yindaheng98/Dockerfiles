FROM busybox AS downloader
ENV FRP_URL=https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_amd64.tar.gz
RUN wget $FRP_URL -O /frp.tar.gz && tar -zxvf /frp.tar.gz -C / --strip-components=1

FROM alpine
COPY --from=downloader /frps /frps
COPY ./write-ini.sh /write-ini.sh

ENV dashboard_user admin
ENV dashboard_user administrator




EXPOSE 7000 7500

ENTRYPOINT [ "/write-ini.sh" ]
CMD [ "/frps", "-c", "/frps.ini" ]