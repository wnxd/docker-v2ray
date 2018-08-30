FRP_VER=0.21.0
ARCH=$(uname -m)
if [[ "{$ARCH}" == "i686" ]] || [[ "${ARCH}" == "i386" ]]; then
    VDIS="386"
elif [[ "{$ARCH}" == *"armv7"* ]] || [[ "{$ARCH}" == "armv6l" ]]; then
    VDIS="arm"
elif [[ "{$ARCH}" == *"armv8"* ]] || [[ "{$ARCH}" == "aarch64" ]]; then
    VDIS="arm64"
elif [[ "{$ARCH}" == *"mips64le"* ]]; then
    VDIS="mips64le"
elif [[ "{$ARCH}" == *"mips64"* ]]; then
    VDIS="mips64"
elif [[ "{$ARCH}" == *"mipsle"* ]]; then
    VDIS="mipsle"
elif [[ "{$ARCH}" == *"mips"* ]]; then
    VDIS="mips"
elif [[ "{$ARCH}" == *"s390x"* ]]; then
    VDIS="s390x"
else
    VDIS="amd64"
fi
FRP_FILE="frp_${FRP_VER}_linux_${VDIS}"

apk --no-cache add curl tar

cd /tmp
curl -sSL https://github.com/fatedier/frp/releases/download/v${FRP_VER}/${FRP_FILE}.tar.gz | tar xz
mv $FRP_FILE/frpc /usr/bin/

rm -rf /var/cache/apk/* /tmp/*
