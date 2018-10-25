FROM golang:latest

WORKDIR /go/src/github.com/getamis/istanbul-tools
RUN git clone https://github.com/getamis/istanbul-tools.git .

RUN make

ENTRYPOINT ["tail", "-f", "/dev/null"]
