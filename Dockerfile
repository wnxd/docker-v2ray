FROM alpine:latest
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

ADD https://storage.googleapis.com/v2ray-docker/v2ray /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/v2ctl /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/geoip.dat /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/geosite.dat /usr/bin/v2ray/

COPY config.json /etc/v2ray/config.json
COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN set -ex && \
    apk --no-cache upgrade && \
    apk --no-cache add bash && \
    apk --no-cache add \
        ca-certificates \
        openssh-server && \
    ssh-keygen -A && \
    mkdir /var/log/v2ray/ &&\
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray

ENV ROOT_PASSWORD=alpine

# SS
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

EXPOSE ${SS_PORT}/tcp
EXPOSE ${SS_PORT}/udp
EXPOSE ${VMESS_PORT}/tcp
EXPOSE ${KCP_PORT_VMESS}/udp

ENTRYPOINT [ "bash", "/usr/bin/entrypoint.sh" ]
