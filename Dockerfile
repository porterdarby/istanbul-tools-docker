FROM golang:latest as builder

WORKDIR /go/src/github.com/getamis/istanbul-tools
RUN git clone https://github.com/getamis/istanbul-tools.git .

RUN make

FROM golang:latest

RUN echo $PATH

COPY --from=builder /go/src/github.com/getamis/istanbul-tools/build/bin/istanbul /go/bin/istanbul

RUN mkdir /workdir && \
    chmod 777 /workdir

WORKDIR /workdir

# ENTRYPOINT ["istanbul"]
# CMD ["--help"]

ENTRYPOINT ["/bin/sh", "-c", "istanbul setup --quorum --num 4 --nodes --verbose --save && ls -al"]
