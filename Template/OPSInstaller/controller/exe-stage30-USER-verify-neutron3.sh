# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script as a user."
#printf " You will use vasabi-1234external_cidr4321-ibasav as an external network.\n"  
#printf " The floating ips are  from vasabi-1234start_floating_ip4321-ibasav to 200.\n"  
#printf "\n1. create initial network...press"
#read varkey

source ./admin-openrc.sh
openstack extension list --network

#neutron net-create ext-net --shared --router:external=True
#neutron subnet-create ext-net --name ext-subnet \
#  --allocation-pool start=vasabi-1234start_floating_ip4321-ibasav,end=vasabi-1234end_floating_ip4321-ibasav \
#  --disable-dhcp --gateway vasabi-1234gateway_ip4321-ibasav vasabi-1234external_cidr4321-ibasav

