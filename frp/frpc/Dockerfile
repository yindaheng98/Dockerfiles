FROM busybox AS downloader
ENV FRP_URL=https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_amd64.tar.gz
RUN wget $FRP_URL -O /frp.tar.gz && tar -zxvf /frp.tar.gz -C / --strip-components=1

FROM alpine
COPY --from=downloader /frpc /frpc
COPY ./write-ini.sh /write-ini.sh

ENV server_addr 192.168.56.1
ENV server_port 7000
ENV name web
ENV type tcp
ENV local_ip 127.0.0.1
ENV local_port 80
ENV remote_port 80

ENTRYPOINT [ "/write-ini.sh" ]
CMD [ "/frpc", "-c", "/frpc.ini" ]