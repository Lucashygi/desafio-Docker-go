FROM alpine:latest as system

WORKDIR /go/app

COPY . .

RUN apk add --no-cache go
RUN go build main.go

FROM scratch as runtime

WORKDIR /go/app

COPY --from=system /go/app/main .

CMD ["./main"]