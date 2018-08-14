#!/bin/bash

rm -f /etc/motd
cat >> /etc/motd << EOF

Author : wnxd <imiku@wnxd.me>
Project : https://hub.docker.com/r/wnxd/docker-v2ray/
Docker Image : wnxd/docker-v2ray

Linux Version : $(cat /etc/redhat-release)
Kernel Version : $(uname -r)
Hostname : $(uname -n)

Enjoy your Docker-Linux Node !

EOF

echo "root:$ROOT_PASSWORD" | chpasswd

echo "Start Success !"

sed -i "s/\[SS_PORT\]/$SS_PORT/g" /etc/v2ray/config.json
sed -i "s/\[SS_PASSWORD\]/$SS_PASSWORD/g" /etc/v2ray/config.json
sed -i "s/\[SS_METHOD\]/$SS_METHOD/g" /etc/v2ray/config.json
sed -i "s/\[VMESS_PORT\]/$VMESS_PORT/g" /etc/v2ray/config.json
sed -i "s/\[VMESS_ID\]/$VMESS_ID/g" /etc/v2ray/config.json
sed -i "s/\[VMESS_LEVEL\]/$VMESS_LEVEL/g" /etc/v2ray/config.json
sed -i "s/\[VMESS_ALTERID\]/$VMESS_ALTERID/g" /etc/v2ray/config.json
sed -i "s/\[KCP_PORT_VMESS\]/$KCP_PORT_VMESS/g" /etc/v2ray/config.json
sed -i "s/\[KCP_MUT\]/$KCP_MUT/g" /etc/v2ray/config.json
sed -i "s/\[KCP_TTI\]/$KCP_TTI/g" /etc/v2ray/config.json
sed -i "s/\[KCP_UPLINK\]/$KCP_UPLINK/g" /etc/v2ray/config.json
sed -i "s/\[KCP_DOWNLINK\]/$KCP_DOWNLINK/g" /etc/v2ray/config.json
sed -i "s/\[KCP_READBUFF\]/$KCP_READBUFF/g" /etc/v2ray/config.json
sed -i "s/\[KCP_WRITEBUFF\]/$KCP_WRITEBUFF/g" /etc/v2ray/config.json

cat /etc/v2ray/config.json

(/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json) &

/usr/sbin/sshd -D -e -o PermitRootLogin=yes
