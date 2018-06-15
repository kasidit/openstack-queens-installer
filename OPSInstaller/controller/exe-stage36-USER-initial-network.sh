# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script as a user."
#read varkey
#
source ./admin-openrc.sh
#
echo "openstack network create --share --provider-physical-network provider --provider-network-type flat provider1"
openstack network create --share --provider-physical-network provider \
 --provider-network-type flat provider1
echo "openstack subnet create --subnet-range 10.0.0.0/24 --gateway 10.0.0.1 --network provider1 --allocation-pool start=10.0.0.100,end=10.0.0.200 --dns-nameserver 8.8.4.4 provider1-v4"
openstack subnet create --subnet-range 10.0.0.0/24 --gateway 10.0.0.1 \
 --network provider1 --allocation-pool start=10.0.0.100,end=10.0.0.200 \
 --dns-nameserver 8.8.4.4 provider1-v4
echo "openstack security group rule create --proto icmp default"
openstack security group rule create --proto icmp default
echo "openstack security group rule create --proto tcp --dst-port 22 default"
openstack security group rule create --proto tcp --dst-port 22 default
echo "openstack flavor create --id 0 --vcpus 1 --ram 64 --disk 1 m1.nano"
openstack flavor create --id 0 --vcpus 1 --ram 64 --disk 1 m1.nano
echo "openstack flavor create --id 1 --vcpus 1 --ram 512 --disk 1 m1.mini"
openstack flavor create --id 1 --vcpus 1 --ram 512 --disk 1 m1.mini
echo "Ping 10.0.0.100"
ping -c 4 10.0.0.100

echo "openstack network set --external provider1"
openstack network set --external provider1
echo "openstack network create selfservice1"
openstack network create selfservice1
echo "openstack subnet create --subnet-range 192.0.2.0/24 --network selfservice1 --dns-nameserver 8.8.4.4 selfservice1-v4"
openstack subnet create --subnet-range 192.0.2.0/24 \
  --network selfservice1 --dns-nameserver 8.8.4.4 selfservice1-v4
echo "openstack router create router1"
openstack router create router1
echo "openstack router add subnet router1 selfservice1-v4"
openstack router add subnet router1 selfservice1-v4
echo "openstack router set router1 --external-gateway provider1"
openstack router set router1 --external-gateway provider1
echo "openstack floating ip create provider1"
openstack floating ip create provider1
