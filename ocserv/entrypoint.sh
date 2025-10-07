#!/bin/sh
set -euo pipefail
mkdir /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

envsubst < /ocserv/conf/default.conf > /ocserv/conf/ocserv.conf
MAX_CLIENTS=${MAX_CLIENTS:-32}
IPV4_NETWORK=${IPV4_NETWORK:-10.10.11.0/24}

# Enable NAT forwarding
iptables -t nat -A POSTROUTING -j MASQUERADE -s "${IPV4_NETWORK}"

/ocserv/dist/sbin/ocserv \
  --foreground  \
  --pid-file /run/ocserv.pid \
  --config /ocserv/conf/ocserv.conf

