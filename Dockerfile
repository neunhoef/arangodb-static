FROM alpine:3.7
MAINTAINER Max Neunhoeffer <max@arangodb.com>

RUN apk update && apk add g++ bison flex make cmake ccache python openssl-dev git linux-vanilla-dev linux-headers vim boost-dev ctags man gdb fish openssh

COPY ./scripts /scripts

ENTRYPOINT [ "/scripts/wait.fish" ]
