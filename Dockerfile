FROM golang:latest as builder
WORKDIR /app
COPY . .
RUN go build fullcycle.go

FROM scratch
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["/app/fullcycle"]