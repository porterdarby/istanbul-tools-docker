ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/porterdarby/istanbul-tools-docker" \
      org.label-schema.schema-version="1.0.0-rc1"


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

