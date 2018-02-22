FROM golang

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR /go/src/app
ADD . /go/src/app

COPY Gopkg.toml Gopkg.lock ./

RUN dep ensure -vendor-only

CMD ["go", "run", "main.go"]