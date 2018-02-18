FROM golang

RUN curl -fsSL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 && chmod +x /usr/local/bin/dep

WORKDIR /go/src/app
ADD . /go/src/app

COPY Gopkg.toml Gopkg.lock ./

RUN dep ensure -vendor-only

CMD ["go", "run", "main.go"]