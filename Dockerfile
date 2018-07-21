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
    
ENV VMESS_PORT=8991
ENV VMESS_ID=00000000-0000-0000-0000-000000000000
ENV VMESS_LEVEL=1
ENV VMESS_AID=64

ADD entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT [ "bash", "/usr/bin/entrypoint.sh" ]
