frpc=/etc/frp/frpc.ini

appendFrp() {
	cat >>$frpc <<EOF
[range:frp_port]
type = ${1}
local_ip = ${2}
local_port = ${3}
remote_port = ${4}
EOF
}

sed -i "s/\[FRP_SERVER_ADDRESS\]/${FRP_SERVER_ADDRESS}/g" $frpc
sed -i "s/\[FRP_SERVER_PORT\]/${FRP_SERVER_PORT}/g" $frpc

arr=${FRP_CLIENT_INFO//\|/ }
appendFrp ${arr[@]}

i=2
extra=FRP_CLIENT_INFO_${i}
while [ ! -z "${!extra}" ]; do
	arr=${!extra//\|/ }
	appendFrp ${arr[@]}
	((i++))
	extra=FRP_CLIENT_INFO_${i}
done

cat $frpc

(/usr/bin/frpc -c /etc/frp/frpc.ini) &
