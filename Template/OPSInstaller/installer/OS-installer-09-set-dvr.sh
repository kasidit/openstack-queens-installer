# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
#
intype=vasabi-1234install_type4321-ibasav
full=full
#
# neutron
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage33-SUDO-dvr-controller-conf.sh | tee log/s33-controller.log
sleep 5
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage34-SUDO-dvr-network-conf.sh | tee log/ss34-network.log
sleep 5
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage35-SUDO-dvr-compute-conf.sh | tee log/s35-compute.log
sleep 5
if [ "$intype" == "$full" ]
then
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage36-SUDO-dvr-compute1-conf.sh | tee log/s36-compute.log
fi
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage37-USER-verify-dvr-network.sh | tee log/s37-controller.log
printf "\nnext run ./OS-installer-10-initial-user-network.sh\n"
