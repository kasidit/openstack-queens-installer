# OpenStack ocata installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script  as user."
echo -n "1. create nova user and endpoint...press"
#read varkey

source ./admin-openrc.sh

openstack user create --domain default --password vasabilabNOVA_PASS nova
openstack role add --project service --user nova admin
openstack service create --name nova \
  --description "OpenStack Compute" compute
openstack endpoint create --region RegionOne \
  compute public http://controller:8774/v2.1/
openstack endpoint create --region RegionOne \
  compute internal http://controller:8774/v2.1/
openstack endpoint create --region RegionOne \
  compute admin http://controller:8774/v2.1/

openstack user create --domain default --password vasabilabNOVA_PASS placement
openstack role add --project service --user placement admin
openstack service create --name placement \
  --description "Placement API" placement
openstack endpoint create --region RegionOne \
  placement public http://controller:8778
openstack endpoint create --region RegionOne \
  placement internal http://controller:8778
openstack endpoint create --region RegionOne \
  placement admin http://controller:8778
