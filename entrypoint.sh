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

echo "Start Success !"
