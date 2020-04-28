FROM alpine

RUN apk --no-cache add \
bind-tools \
curl \
busybox-extras
