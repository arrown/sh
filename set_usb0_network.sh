#!/bin/bash

sudo ip route del default 2>/dev/null
sudo ip route add default via 192.168.225.1 dev usb0


sudo bash -c 'cat > /etc/resolv.conf << EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF'
