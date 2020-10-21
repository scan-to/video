FROM golang:alpine AS builder

WORKDIR /app/src
COPY . /app/src

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    && apk add --no-cache ca-certificates git gcc build-base \
    && go build -x -v -o /app/api main.go

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/api /app
COPY static /app/static/
COPY video /app/video/

RUN apk --no-cache add ca-certificates \
    && chmod a+x /app/api

ENTRYPOINT [ "./api" ]

EXPOSE 9090