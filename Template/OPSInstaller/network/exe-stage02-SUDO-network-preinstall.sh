# OpenStack Queens installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
# run with sudo or as root
#
#!/bin/bash -x
cd $HOME/OPSInstaller/network
pwd
printf "1. set interface/hosts files.. press any key\n"
#read varkey
cp files/interfaces /etc/network/interfaces
cp files/hosts /etc/hosts

printf "2. set ntp server.. press any key\n"
#read varkey
apt-get -y install chrony
cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart

printf "3. restart eth networking.. press\n"
#read varkey
ifdown vasabi-1234network_ip_nic4321-ibasav
ifup vasabi-1234network_ip_nic4321-ibasav
ifdown vasabi-1234data_tunnel_network_node_ip_nic4321-ibasav
ifup vasabi-1234data_tunnel_network_node_ip_nic4321-ibasav
ifdown vasabi-1234vlan_network_node_ip_nic4321-ibasav
ifup vasabi-1234vlan_network_node_ip_nic4321-ibasav
ifdown vasabi-1234external_cidr_nic4321-ibasav
ifup vasabi-1234external_cidr_nic4321-ibasav
#
sleep 5
date
# restore later 
#cp /etc/sudoers files/sudoers.save
#
ifconfig
