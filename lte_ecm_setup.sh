#!/bin/bash

DEVICE="/dev/ttyUSB2"
INTERFACE="usb0"
STATIC_IP="192.168.225.20"
GATEWAY="192.168.225.1"
LOG="/home/pal/ecm_setup.log"

echo "['date'] ECM setting start" | tee -a "$LOG"

ip addr flush dev $INTERFACE
ip addr add ${STATIC_IP}/24 dev $INTERFACE
ip link set $INTERFACE up
ip rout add default vi $GATEWAY dev $INTERFACE

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" > /etc/resolv.conf

systemctl restart NetworkManager
