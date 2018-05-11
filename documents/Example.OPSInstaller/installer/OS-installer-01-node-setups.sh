# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
intype=full
full=full
#
# node setups
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage01-SUDO-preinstall.sh | tee log/s01-controller.log
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage02-SUDO-network-preinstall.sh | tee log/s02-network.log
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage03-SUDO-compute-preinstall.sh | tee log/s03-compute.log
if [ "$intype" == "$full" ]
then
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage03-SUDO-compute-preinstall.sh | tee log/s03-compute.log
fi
printf "\nnext run ./OS-installer-02-mysql.sh \n"
