frpc=/etc/frp/frpc.ini

appendFrp()
{
    cat >> $frpc << EOF
[range:frp_port]
type = ${1}
local_ip = ${2}
local_port = ${3}
remote_port = ${4}
EOF
}

sed -i "s/\[FRP_SERVER_ADDRESS\]/${SS_PORT}/g" $frpc
appendFrp (${FRP_CLIENT_INFO//|/ })

i=2
extra=FRP_CLIENT_INFO_${i}
while [ ! -z "${!extra}"]; do
    appendFrp (${!extra//|/ })
    i++
    extra=FRP_CLIENT_INFO_${i}
done

cat $frpc

(/usr/bin/frpc -c /etc/frp/frpc.ini) &
