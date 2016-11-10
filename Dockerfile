FROM alpine:3.4

MAINTAINER Leonid Makarov <leonid.makarov@ffwagency.com>

RUN apk add --update --no-cache \
	bash \
	curl \
	openssh \
	&& rm -rf /var/cache/apk/*

RUN \
	mkdir -p /root/.ssh && \
	mkdir -p /root/build

COPY config/.ssh/config /root/.ssh/config
COPY bin/build-env /usr/local/bin/build-env
COPY bin/build-init /usr/local/bin/build-init
COPY bin/slack /usr/local/bin/slack

WORKDIR /root/build
