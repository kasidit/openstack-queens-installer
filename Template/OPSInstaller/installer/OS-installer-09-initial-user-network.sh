# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
nettype=vasabi-1234network_type4321-ibasav
dvr=dvr_ovs
#
# initial user network
if [ "$nettype" == "$dvr" ]
then
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage36-USER-initial-network.sh | tee log/s36-controller.log
fi
printf "\nNext ./OS-installer-10-horizon.sh\n"
