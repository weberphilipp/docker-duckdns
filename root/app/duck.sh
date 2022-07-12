#!/usr/bin/with-contenv bash

. /app/duck.conf
IPV4=$(curl -4 -sS --max-time 60 ip.me)
IPV6=$(curl -6 -sS --max-time 60 ip.me)
RESPONSE=$(curl -sS --max-time 60 "https://www.duckdns.org/update?domains=${SUBDOMAINS}&token=${TOKEN}&ip=${IPV4}&ipv6=${IPV6}")
if [ "${RESPONSE}" = "OK" ]; then
    echo "Your IP was updated at $(date)"
    echo "IPv4: ${IPV4}"
    echo "IPv6: ${IPV6}"
else
    echo -e "Something went wrong, please check your settings $(date)\nThe response returned was:\n${RESPONSE}"
fi
