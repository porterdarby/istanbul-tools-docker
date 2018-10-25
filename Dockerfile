FROM golang:1.11.1-alpine3.8 as builder

WORKDIR /go/src/github.com/getamis/istanbul-tools
RUN apk add gcc git libc-dev make && \
    git clone https://github.com/getamis/istanbul-tools.git .

RUN make

FROM golang:1.11.1-alpine3.8

COPY --from=builder /go/src/github.com/getamis/istanbul-tools/build/bin/istanbul /go/bin/istanbul

RUN mkdir /workdir && \
    chmod 777 /workdir

WORKDIR /workdir

ENTRYPOINT ["istanbul"]
CMD ["--help"]

