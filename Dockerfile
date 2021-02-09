FROM alpine:3.12

ENV GRPCURL_VERSION=1.8.0
ENV GRPCURL_SHA256=7261c1542cf139b0663b10948fe53578322cc36e5322406b4e231564f91712f1

RUN apk --no-cache add \
bind-tools \
curl \
busybox-extras

RUN cd /tmp && \
wget -nv  -O /tmp/grpcurl.tar.gz https://github.com/fullstorydev/grpcurl/releases/download/v${GRPCURL_VERSION}/grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz && \
tar -xvzf grpcurl.tar.gz &&\
echo "${GRPCURL_SHA256}  grpcurl.tar.gz" | sha256sum -c - && \
cp grpcurl /usr/bin &&\
rm grpcurl.tar.gz

ARG VERSION=unset
ENV PS1="kdebugimage-${VERSION}:\w\$ "