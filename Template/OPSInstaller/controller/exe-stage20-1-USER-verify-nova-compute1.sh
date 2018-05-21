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
echo -n "Verify nova"
#read varkey
source ./admin-openrc.sh

openstack hypervisor list
sudo su -s /bin/sh -c "nova-manage cell_v2 discover_hosts --verbose" nova
