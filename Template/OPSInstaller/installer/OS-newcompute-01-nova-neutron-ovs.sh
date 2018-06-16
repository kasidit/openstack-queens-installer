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
newHostname=${1}
#
ssh -t openstack@${newHostname} sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage03-SUDO-compute-preinstall.sh | tee log/s03-${newHostname}-compute.log
ssh -t openstack@${newHostname} sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage06-SUDO-compute-mysql.sh | tee log/s06-${newHostname}-compute.log
ssh -t openstack@${newHostname} sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage19-SUDO-nova-compute.sh | tee log/s19-${newHostname}-compute.log
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage20-0-USER-verify-nova-compute.sh | tee log/s20-${newHostname}-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage20-1-USER-verify-nova-compute1.sh | tee log/s20-${newHostname}-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage20-2-USER-verify-nova.sh | tee log/s20-${newHostname}-controller.log
ssh -t openstack@${newHostname} sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage29-SUDO-compute-neutron.sh | tee log/s29-${newHostname}-compute.log
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage30-USER-verify-neutron3.sh | tee log/s30-${newHostname}-controller.log
printf "\nnext, if you want to set ${newHostname} to be a DVR node, run ./OS-newcompute-02-set-dvr.sh\n"
