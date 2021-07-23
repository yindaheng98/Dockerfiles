FROM golang:alpine AS builder
ENV REPO=https://github.com/fatedier/frp
ARG VERSION=v0.34.3
RUN apk add --no-cache git make && git clone -b $VERSION $REPO && \
    cd frp && make frps

FROM alpine
COPY --from=builder /go/frp/bin/frps /frps
COPY ./frps.ini /frps.ini
EXPOSE 7000 7500
CMD [ "/frps", "-c", "/frps.ini" ]