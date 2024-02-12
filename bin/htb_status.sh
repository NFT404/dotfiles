#!/bin/sh

IFACE=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^tun')

if [ -n "$IFACE" ]; then
    IP_ADDR=$(ip -o -4 addr show dev "$IFACE" | awk '{print $4}' | cut -d'/' -f1)
    echo "%{F#a486dd}HTB %{F#FFFFFF}$IP_ADDR%{u-}"
else
    echo "%{F#a486dd}HTB%{u-} Disconnected"
fi

