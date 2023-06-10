FROM alpine:3.18

RUN apk --no-cache add \
bind-tools \
curl \
busybox-extras

RUN set -xe \
  && GRPCURL_VERSION=1.8.0 \
  && GRPCURL_SHA256=7261c1542cf139b0663b10948fe53578322cc36e5322406b4e231564f91712f1 \
  && wget -nv  -O /tmp/grpcurl.tar.gz https://github.com/fullstorydev/grpcurl/releases/download/v${GRPCURL_VERSION}/grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz \
  && echo "${GRPCURL_SHA256}  /tmp/grpcurl.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/grpcurl.tar.gz -C /usr/bin/ grpcurl \
  && rm /tmp/grpcurl.tar.gz

ARG VERSION=unset
ENV PS1="kdebugimage-${VERSION}:\w\$ "