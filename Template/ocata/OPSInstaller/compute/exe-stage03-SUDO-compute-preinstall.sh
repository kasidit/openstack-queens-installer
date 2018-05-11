# OpenStack ocata installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/compute
pwd
printf "1. set interface/hosts files.. press\n"
#read varkey
cp files/interfaces /etc/network/interfaces
cp files/hosts /etc/hosts

printf "2. set ntp server.. press\n"
#read varkey
apt-get -y install chrony
cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart

printf "3. restart eth networking.. press\n"
#read varkey
ifdown vasabi-1234compute_ip_nic4321-ibasav
ifup vasabi-1234compute_ip_nic4321-ibasav
ifdown vasabi-1234data_tunnel_compute_node_ip_nic4321-ibasav
ifup vasabi-1234data_tunnel_compute_node_ip_nic4321-ibasav
ifdown vasabi-1234vlan_compute_node_ip_nic4321-ibasav
ifup vasabi-1234vlan_compute_node_ip_nic4321-ibasav
ifdown vasabi-1234external_cidr_nic4321-ibasav
ifup vasabi-1234external_cidr_nic4321-ibasav
#
# prevent fragmentation
#
#ifconfig vasabi-1234compute_ip_nic4321-ibasav mtu 1700
#ifconfig vasabi-1234data_tunnel_compute_node_ip_nic4321-ibasav mtu 1700
#
# restore later 
#cp /etc/sudoers files/sudoers.save
#echo "vasabi ALL=NOPASSWD: ALL" >> /etc/sudoers
#
ifconfig
