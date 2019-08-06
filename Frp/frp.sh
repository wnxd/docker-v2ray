frpc=/etc/frp/frpc.ini
nodename=$(uname -n)

appendFrp() {
	cat >>$frpc <<EOF

[range:${nodename}_port${1}]
type = ${2}
local_ip = ${3}
local_port = ${4}
remote_port = ${5}
use_compression = true
EOF
}

sed -i "s/\[FRP_SERVER_ADDRESS\]/${FRP_SERVER_ADDRESS}/g" $frpc
sed -i "s/\[FRP_SERVER_PORT\]/${FRP_SERVER_PORT}/g" $frpc
sed -i "s/\[FRP_SERVER_TOKEN\]/${FRP_SERVER_TOKEN}/g" $frpc

arr=${FRP_CLIENT_INFO//\|/ }
appendFrp 1 ${arr[@]}

i=2
extra=FRP_CLIENT_INFO_${i}
while [ ! -z "${!extra}" ]; do
	arr=${!extra//\|/ }
	appendFrp $i ${arr[@]}
	((i++))
	extra=FRP_CLIENT_INFO_${i}
done

cat $frpc

(/usr/bin/frpc -c /etc/frp/frpc.ini) &
