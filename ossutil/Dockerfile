FROM golang:1.11-alpine AS builder
ARG VERSION=1.7.5
RUN apk add --no-cache git && cd src && \
    go get github.com/aliyun/ossutil && \
    go build github.com/aliyun/ossutil/ossutil.go

FROM alpine
COPY --from=builder /go/bin/ossutil /bin/ossutil