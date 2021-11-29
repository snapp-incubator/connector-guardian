FROM alpine:3.13

ARG JQ_VERSION="1.6"

LABEL maintainer="sentoz66@gmail.com"

ENV KAFKA_CONNECT_HOST=localhost
ENV KAFKA_CONNECT_PORT=8083


RUN apk add --update --no-cache \
    bash curl sort && \
    curl -sLo /usr/bin/jq \
    "https://github.com/stedolan/jq/releases/download/jq-$JQ_VERSION/jq-linux64"

COPY ./connector-restart /connector-restart

ENTRYPOINT ["/connector-restart"]