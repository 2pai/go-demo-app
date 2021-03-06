FROM golang:alpine AS build-env
RUN apk add build-base git bzr mercurial gcc
ADD . /src
RUN cd /src && go build -o goapp

FROM alpine
WORKDIR /app
COPY --from=build-env /src/goapp /app/
ENTRYPOINT ./goapp
