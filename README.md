# Global

### Server Config
| Item                 |                                Value |
| :------------------- | -----------------------------------: |
| ROOT_PASSWORD        |                               alpine |

### Ssh Config
| Item                 |                                Value |
| :------------------- | -----------------------------------: |
| SSH_PORT             |                                 7777 |

### Shadowsocks Config

| Item                 |                                Value |
| :------------------- | -----------------------------------: |
| SS_PORT              |                                 8888 |
| SS_PASSWORD          |                                 wnxd |
| SS_METHOD            |                          aes-256-gcm |

### Vmess Config

| Item                 |                                Value |
| :------------------- | -----------------------------------: |
| VMESS_PORT           |                                 9999 |
| VMESS_ID             | 00000000-0000-0000-0000-000000000000 |
| VMESS_LEVEL          |                                    1 |
| VMESS_ALTERID        |                                   10 |

### Kcp Config

| Item                 |                                Value |
| :------------------- | -----------------------------------: |
| KCP_PORT_VMESS       |                                 9999 |
| KCP_MUT              |                                 1350 |
| KCP_TTI              |                                   50 |
| KCP_UPLINK           |                                    5 |
| KCP_DOWNLINK         |                                   20 |
| KCP_READBUFF         |                                    2 |
| KCP_WRITEBUFF        |                                    2 |

# Relay

| Item                 |                                Value |
| :------------------- | -----------------------------------: |
| RELAY_PORT           |                                11111 |
| RELAY_TARGET_ADDRESS |                              0.0.0.0 |
| RELAY_TARGET_PORT    |                                    0 |
