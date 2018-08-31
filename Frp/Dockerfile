FROM wnxd/docker-v2ray:latest
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

COPY frp_install.sh /usr/bin/frp_install.sh
COPY frp.sh /usr/bin/frp.sh
COPY frpc.ini /etc/frp/frpc.ini

RUN bash /usr/bin/frp_install.sh

ENV FRP_SERVER_ADDRESS=0.0.0.0
ENV FRP_SERVER_PORT=0
ENV FRP_SERVER_TOKEN=wnxd
ENV FRP_CLIENT_INFO="tcp|127.0.0.1|${SSH_PORT}|0"

CMD [ "/usr/bin/frp.sh" ]
