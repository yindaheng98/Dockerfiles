FROM golang:1.15-alpine AS builder
ARG VERSION=v2.0.1
RUN apk add --no-cache git && cd src && \
    git clone -b ${VERSION} https://github.com/iochen/v2gen/ && \
    cd v2gen && env GOPRIVATE=github.com/v2ray/v2ray-core go build ./cmd/v2gen

FROM alpine
COPY --from=builder /go/src/v2gen/v2gen /bin/v2gen