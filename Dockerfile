# Build the source
FROM golang:1.11.1-alpine3.8 as builder
RUN apk add gcc git libc-dev make && \
    mkdir -p /go/src/github.com/getamis/istanbul-tools && \
    cd /go/src/github.com/getamis/istanbul-tools && \
    git clone https://github.com/getamis/istanbul-tools.git . && \
    make

# Move binary to a clean image
FROM alpine:3.8

COPY --from=builder /go/src/github.com/getamis/istanbul-tools/build/bin/istanbul /usr/bin/istanbul

WORKDIR /workdir

ENTRYPOINT ["istanbul"]
CMD ["--help"]

