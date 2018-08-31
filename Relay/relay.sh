tmp=${TMPDIR-/tmp}/relay$$

cat > $tmp << EOF
    {
      "port": \${RELAY_PORT},
      "protocol": "dokodemo-door",
      "settings": {
        "address": "\${RELAY_TARGET_ADDRESS}",
        "port": \${RELAY_TARGET_PORT},
        "network": "tcp,udp"
      }
    },
EOF

sed -i "20r${tmp}" /etc/v2ray/config.json

rm -rf $tmp
