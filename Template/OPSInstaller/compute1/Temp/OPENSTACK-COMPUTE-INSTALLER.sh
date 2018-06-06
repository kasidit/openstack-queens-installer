# Openstack icehouse installation script on ubuntu 14.04 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2014  Kasidit Chanchio
#
#!/bin/bash -x
#
cd $HOME/OPSInstaller/Compute
pwd
#sudo /bin/bash -x stage03-SUDO-compute-preinstall.sh 2>&1 | tee log/s03.log
#printf "\n Next? \n"
#read varkey
#clear
sudo /bin/bash -x stage06-SUDO-compute-mysql.sh 2>&1 | tee log/s06.log
printf "\n Next? \n"
read varkey
clear
sudo /bin/bash -x stage20-SUDO-nova-comp.sh 2>&1 | tee log/s20.log
printf "\n Next? \n"
read varkey
clear
sudo /bin/bash -x stage26-SUDO-neutron-comp.sh 2>&1 | tee log/s26.log
printf "\n Done adding a compute node \n"
#sudo /bin/bash -x stageFIN-SUDO-postinstall.sh 2>&1 | tee log/s.log
