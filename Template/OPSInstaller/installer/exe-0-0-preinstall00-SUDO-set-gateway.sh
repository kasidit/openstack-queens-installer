#!/bin/bash -x
echo "Run as root or sudo"
#
echo "1. enable management network"
cp files/interfaces /etc/network/interfaces
cp files/hosts /etc/hosts
#
ifdown vasabi-1234controller_ip_nic4321-ibasav
ifup vasabi-1234controller_ip_nic4321-ibasav
ifconfig

echo "2. enable forwarding"
cp files/sysctl.conf /etc/sysctl.conf
sysctl -w net.ipv4.ip_forward=1
cp files/rc.local /etc/rc.local
#
echo "3. set NAT"
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables --table nat -A POSTROUTING -o vasabi-1234gateway_ip_nic4321-ibasav -j MASQUERADE
/sbin/iptables -A FORWARD -p tcp --syn -s vasabi-1234external_cidr4321-ibasav -j TCPMSS --clamp-mss-to-pmtu
#
