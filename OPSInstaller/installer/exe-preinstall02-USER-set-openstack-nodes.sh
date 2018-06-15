#!/bin/bash -x 
#
# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#
intype=full
full=full
#
pwd

echo "copy installer to nodes.. press"
#read varkey
scp OPSInstaller.tar openstack@controller:/home/openstack/OPSInstaller.tar
scp OPSInstaller.tar openstack@network:/home/openstack/OPSInstaller.tar
scp OPSInstaller.tar openstack@compute:/home/openstack/OPSInstaller.tar
if [ "$intype" == "$full" ]
then
scp OPSInstaller.tar openstack@compute1:/home/openstack/OPSInstaller.tar
fi
#
echo "remove existing OPSInstaller on controller node"
#read varkey
ssh openstack@controller rm -rf /home/openstack/OPSInstaller | tee log/extract-controller-current.log
echo "remove existing OPSInstaller on network node"
#read varkey
ssh openstack@network rm -rf /home/openstack/OPSInstaller | tee log/extract-network-current.log
echo "remove existing OPSInstaller on compute node"
#read varkey
ssh openstack@compute rm -rf /home/openstack/OPSInstaller | tee log/extract-compute-current.log
if [ "$intype" == "$full" ]
then
echo "remove existing OPSInstaller on compute1 node"
#read varkey
ssh openstack@compute1 rm -rf /home/openstack/OPSInstaller | tee log/extract-compute-current.log
fi
#

echo "extract installer files on controller.. press"
#read varkey
ssh openstack@controller tar xvf /home/openstack/OPSInstaller.tar | tee log/extract-controller-current.log
ssh openstack@controller /home/openstack/OPSInstaller/remove-all-except-controller.sh 
echo "extract installer files on network node.. press"
#read varkey
ssh openstack@network tar xvf /home/openstack/OPSInstaller.tar | tee log/extract-network-current.log
ssh openstack@network /home/openstack/OPSInstaller/remove-all-except-network.sh 
echo "extract installer files on compute node.. press"
#read varkey
ssh openstack@compute tar xvf /home/openstack/OPSInstaller.tar | tee log/extract-compute-current.log
ssh openstack@compute /home/openstack/OPSInstaller/remove-all-except-compute.sh
if [ "$intype" == "$full" ]
then
echo "extract installer files on compute1 node.. press"
#read varkey
ssh openstack@compute1 tar xvf /home/openstack/OPSInstaller.tar | tee log/extract-compute-current.log
ssh openstack@compute1 /home/openstack/OPSInstaller/remove-all-except-compute1.sh 
fi
#

