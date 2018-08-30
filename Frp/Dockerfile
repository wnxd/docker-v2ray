FROM wnxd/docker-v2ray:latest
LABEL MAINTAINER="wnxd <imiku@wnxd.me>"

COPY frp_install.sh /usr/bin/frp_install.sh

RUN bash /usr/bin/frp_install.sh

CMD [ "/usr/bin/frp.sh" ]
