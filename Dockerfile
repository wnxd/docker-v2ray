FROM alpine:latest
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

ADD https://storage.googleapis.com/v2ray-docker/v2ray /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/v2ctl /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/geoip.dat /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/geosite.dat /usr/bin/v2ray/

COPY config.json /etc/v2ray/config.json

RUN set -ex && \
    apk --no-cache add ca-certificates && \
    mkdir /var/log/v2ray/ &&\
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray

# SS
ENV SS_PORT=8989
ENV SS_PASSWORD=wnxd
ENV SS_METHOD=aes-256-cfb

# vmess
ENV VMESS_PORT=8991
ENV VMESS_ID=00000000-0000-0000-0000-000000000000
ENV VMESS_LEVEL=1
ENV VMESS_ALTERID=64

# kcp
ENV KCP_PORT_VMESS=8992
ENV KCP_MUT=1350
ENV KCP_TTI=20
ENV KCP_UPLINK=5
ENV KCP_DOWNLINK=100
ENV KCP_READBUFF=1
ENV KCP_WRITEBUFF=1

EXPOSE ${SS_PORT}/tcp
EXPOSE ${SS_PORT}/udp
EXPOSE ${VMESS_PORT}/tcp
EXPOSE ${KCP_PORT_VMESS}/udp

ADD entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
