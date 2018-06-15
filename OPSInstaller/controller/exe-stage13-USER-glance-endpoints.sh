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
source ./admin-openrc.sh
#
openstack user create --domain default --password GLANCE_PASS glance
#
openstack role add --project service --user glance admin
#
openstack service create --name glance \
  --description "OpenStack Image" image

openstack endpoint create --region RegionOne \
  image public http://controller:9292
openstack endpoint create --region RegionOne \
  image internal http://controller:9292
openstack endpoint create --region RegionOne \
  image admin http://controller:9292
