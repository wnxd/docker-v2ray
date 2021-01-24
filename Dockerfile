FROM golang:latest as builder
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

WORKDIR /
RUN git clone https://github.com/v2fly/v2ray-core.git
RUN cd v2ray-core && \
    # go env -w GOPROXY=https://goproxy.io,direct && \
    go mod download && \
    CGO_ENABLED=0 go build -o /usr/bin/v2ray/v2ray -trimpath -ldflags "-s -w -buildid=" ./main

FROM alpine:latest

COPY --from=builder /usr/bin/v2ray /usr/bin/v2ray
COPY config.json /etc/v2ray/config.json
COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN set -ex && \
    apk --no-cache upgrade && \
    apk --no-cache add \
        bash \
        ca-certificates \
        openssh-server && \
    rm -rf /var/cache/apk/* && \
    ssh-keygen -A && \
    mkdir /var/log/v2ray/

ENV ROOT_PASSWORD=alpine

# ssh
ENV SSH_PORT=7777

# ss
ENV SS_PORT=8888
ENV SS_PASSWORD=wnxd
ENV SS_METHOD=aes-256-gcm

# vmess
ENV VMESS_PORT=9999
ENV VMESS_ID=00000000-0000-0000-0000-000000000000
ENV VMESS_LEVEL=1
ENV VMESS_ALTERID=64

# kcp
ENV KCP_PORT_VMESS=9999
ENV KCP_MUT=1350
ENV KCP_TTI=50
ENV KCP_UPLINK=5
ENV KCP_DOWNLINK=20
ENV KCP_READBUFF=2
ENV KCP_WRITEBUFF=2

EXPOSE ${SSH_PORT}/tcp
EXPOSE ${SS_PORT}/tcp
EXPOSE ${SS_PORT}/udp
EXPOSE ${VMESS_PORT}/tcp
EXPOSE ${KCP_PORT_VMESS}/udp

ENTRYPOINT [ "bash", "/usr/bin/entrypoint.sh" ]
