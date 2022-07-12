#!/usr/bin/with-contenv bash

. /app/duck.conf
URL="https://www.duckdns.org/update?domains=${SUBDOMAINS}&token=${TOKEN}"
if [ "$IPV4" != "false" ]; then
    IPV4=$(curl -4 -sS --max-time 60 ip.me)
    URL="${URL}&ip=${IPV4}"
    echo "IPv4: ${IPV4}"
fi
if [ "$IPV6" != "false" ]; then
    IPV6=$(curl -6 -sS --max-time 60 ip.me)
    URL="${URL}&ipv6=${IPV6}"
    echo "IPv6: ${IPV6}"
fi
RESPONSE=$(curl -sS --max-time 60 "${URL}")
if [ "${RESPONSE}" = "OK" ]; then
    echo "Your IP was updated at $(date)"
else
    echo -e "Something went wrong, please check your settings $(date)\nThe response returned was:\n${RESPONSE}"
fi
