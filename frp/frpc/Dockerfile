FROM golang:alpine AS builder
ENV REPO=https://github.com/fatedier/frp
ARG VERSION=v0.34.3
RUN apk add --no-cache git make && git clone -b $VERSION $REPO && \
    cd frp && make frpc

FROM alpine
COPY --from=builder /go/frp/bin/frpc /frpc
COPY ./frpc.ini /frpc.ini

CMD [ "/frpc", "-c", "/frpc.ini" ]