# Openstack icehouse installation script on ubuntu 14.04 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2014  Kasidit Chanchio
#
#!/bin/bash -x
#
cd $HOME/OPSInstaller/Network
pwd
#sudo /bin/bash -x ./stage02-SUDO-network-preinstall.sh 2>&1 | tee log/s02.log
#printf "\n Next? \n"
#read varkey
#clear
sudo /bin/bash -x ./stage05-SUDO-network-mysql.sh 2>&1 | tee log/s05.log
printf "\n Next? \n"
read varkey
clear
sudo /bin/bash -x ./stage23-SUDO-network-neutron.sh 2>&1 | tee log/s23.log
printf "\n Next? \n"
read varkey
clear
sudo /bin/bash -x ./stage25-SUDO-set-ml2.sh 2>&1 | tee log/s25.log
printf "\n Done adding a network node \n"
#sudo /bin/bash -x ./stageFIN-SUDO-postinstall.sh 2>&1 | tee log/s.log
