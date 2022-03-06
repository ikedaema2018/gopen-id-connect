FROM golang:1.18rc1-alpine3.15

WORKDIR /go/src

COPY go.mod go.sum ./
RUN go mod download

COPY ./main.go  ./

ARG GOOS=linux
ARG GOARCH=amd64
RUN go build \
    -o /go/bin/main

ENTRYPOINT ["/go/bin/main"]