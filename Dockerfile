FROM alpine

ENV GRPCURL_VERSION=v1.6.0

RUN apk --no-cache add \
bind-tools \
curl \
busybox-extras

RUN cd /tmp && \
wget https://github.com/fullstorydev/grpcurl/releases/download/${GRPCURL_VERSION}/grpcurl_1.6.0_linux_x86_64.tar.gz &&\
tar -xvzf grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz &&\
cp grpcurl /usr/bin &&\
rm grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz
