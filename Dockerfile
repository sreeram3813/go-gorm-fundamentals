# Build
FROM golang:alpine AS build

WORKDIR /app

COPY . ./
RUN go mod download

RUN go build -o /go-gorm-fundamentals

## Deploy
FROM alpine:latest

WORKDIR /

COPY --from=build /go-gorm-fundamentals /go-gorm-fundamentals

EXPOSE 8080

ENTRYPOINT ["/go-gorm-fundamentals"]