#!/bin/bash -x
echo "Run as root or sudo"
#
echo "1. enable management network"
cp files/interfaces /etc/network/interfaces
cp files/hosts /etc/hosts
#
ifdown ens3
ifup ens3
ifconfig

echo "2. enable forwarding"
cp files/sysctl.conf /etc/sysctl.conf
sysctl -w net.ipv4.ip_forward=1
cp files/rc.local /etc/rc.local
#
echo "3. set NAT"
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables --table nat -A POSTROUTING -o ens3 -j MASQUERADE
/sbin/iptables -A FORWARD -p tcp --syn -s 10.201.0.0/24 -j TCPMSS --clamp-mss-to-pmtu
#
