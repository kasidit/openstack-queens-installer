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
echo -n "Get cirros image..."
#
source ./admin-openrc.sh

wget http://download.cirros-cloud.net/0.3.5/cirros-0.3.5-x86_64-disk.img

printf "\nUpload cirros image to glance...\n"

openstack image create "cirros" \
  --file cirros-0.3.5-x86_64-disk.img \
  --disk-format qcow2 --container-format bare \
  --public

printf "\nList glnace images and remove cirros file...\n"
openstack image list

rm cirros-0.3.5-x86_64-disk.img
