FROM golang:latest

WORKDIR /go/src/github.com/getamis/istanbul-tools
RUN git clone https://github.com/getamis/istanbul-tools.git .

RUN make

FROM golang:latest

COPY --from=builder /go/src/github.com/getamis/istanbul-tools/build/bin/istanbul /go/bin/istanbul

RUN mkdir /workdir && \
    chmod 777 /workdir

WORKDIR /workdir

ENTRYPOINT ["istanbul"]
CMD ["--help"]
