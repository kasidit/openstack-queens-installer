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
#printf " You will use 10.201.0.0/24 as an external network.\n"  
#printf " The floating ips are  from 10.201.0.100 to 200.\n"  
#printf "\n1. create initial network...press"
#read varkey

source ./admin-openrc.sh
openstack extension list --network

#neutron net-create ext-net --shared --router:external=True
#neutron subnet-create ext-net --name ext-subnet \
#  --allocation-pool start=10.201.0.100,end=10.201.0.200 \
#  --disable-dhcp --gateway 10.201.0.1 10.201.0.0/24

