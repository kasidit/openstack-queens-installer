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
nettype=dvr_ovs
ovs=classic_ovs
#
# neutron
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage21-SUDO-neutron-database.sh | tee log/s21-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage22-USER-neutron-endpoints.sh | tee log/s22-controller.log
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage23-SUDO-neutron.sh | tee log/s23-controller.log
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage24-USER-verify-neutron.sh | tee log/s24-controller.log
sleep 5
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage25-SUDO-network-neutron.sh | tee log/s25-network.log
sleep 5
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage26-SUDO-reconfig-neutron-nova.sh | tee log/s26-controller.log
sleep 5
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage27-SUDO-ovs-service.sh | tee log/s27-network.log
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage28-USER-verify-neutron2.sh | tee log/s28-controller.log
sleep 5
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage29-SUDO-compute-neutron.sh | tee log/s29-compute.log
sleep 5
if [ "$intype" == "$full" ]
then
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage29-SUDO-compute-neutron.sh | tee log/s29-compute.log
fi
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage30-USER-verify-neutron3.sh | tee log/s30-controller.log
if [ "$nettype" == "$ovs" ]
then
  ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage37-USER-initial-network.sh | tee log/s37-controller.log
  printf "\nnext run ./OS-installer-09-horizon.sh\n"
else
  printf "\nnext run ./OS-installer-08-set-dvr.sh\n"
fi
