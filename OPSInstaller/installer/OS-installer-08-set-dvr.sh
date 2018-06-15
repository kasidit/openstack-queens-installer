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
intype=full
full=full
#
# neutron
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage31-SUDO-dvr-controller-conf.sh | tee log/s31-controller.log
sleep 5
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage32-SUDO-dvr-network-conf.sh | tee log/ss32-network.log
sleep 5
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage33-SUDO-dvr-compute-conf.sh | tee log/s33-compute.log
sleep 5
if [ "$intype" == "$full" ]
then
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage34-SUDO-dvr-compute1-conf.sh | tee log/s34-compute.log
fi
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage35-USER-verify-dvr-network.sh | tee log/s35-controller.log
printf "\nnext run ./OS-installer-09-initial-user-network.sh\n"
