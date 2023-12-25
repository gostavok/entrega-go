FROM golang:1.16 AS builder

WORKDIR ./criar
RUN go mod init entrega && \
    echo 'package main\n\nimport "fmt"\n\nfunc main() {\n    fmt.Println("Full Cycle Rocks!!")\n}' > main.go && \
    go build -o entrega -tags=prod

FROM scratch

COPY --from=builder /go/criar/entrega .

CMD [ "./entrega" ]
