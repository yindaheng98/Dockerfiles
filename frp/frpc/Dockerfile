FROM busybox AS downloader
ENV FRP_URL=https://github.com/fatedier/frp/releases/download/v0.34.3/frp_0.34.3_linux_amd64.tar.gz
RUN wget $FRP_URL -O /frp.tar.gz && tar -zxvf /frp.tar.gz -C / --strip-components=1

FROM alpine
COPY --from=downloader /frpc /frpc
COPY ./frpc.ini /frpc.ini

CMD [ "/frpc", "-c", "/frpc.ini" ]