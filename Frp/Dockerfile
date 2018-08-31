FROM wnxd/docker-v2ray:latest
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

COPY frp_install.sh /usr/bin/frp_install.sh
COPY frp.sh /usr/bin/frp.sh
COPY frpc.ini /etc/frp/frpc.ini

RUN bash /usr/bin/frp_install.sh

CMD [ "/usr/bin/frp.sh" ]
