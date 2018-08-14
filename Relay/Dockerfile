FROM wnxd/docker-v2ray:latest
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

COPY relay.sh /usr/bin/relay.sh

ENV RELAY_PORT=11111
ENV RELAY_TARGET_ADDRESS=0.0.0.0
ENV RELAY_TARGET_PORT=0

EXPOSE ${RELAY_PORT}/tcp
EXPOSE ${RELAY_PORT}/udp

CMD [ "/usr/bin/relay.sh" ]
