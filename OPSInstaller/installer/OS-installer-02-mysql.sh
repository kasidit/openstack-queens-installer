
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
# mysql
printf "\nIn this part of the installation, you need to remeber the MYSQL PASSWORD of MYSQL root user\n"
printf "set earlier in the .install_paramrc.sh file. The script will ask for the password when install mysql. \n"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage04-SUDO-mysql.sh | tee log/s04-controller.log
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage05-SUDO-network-mysql.sh | tee log/s05-network.log
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage06-SUDO-compute-mysql.sh | tee log/s06-compute.log
if [ "$intype" == "$full" ]
then
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage06-SUDO-compute-mysql.sh | tee log/s06-compute.log
fi
printf "\nnext run ./OS-installer-03-rabbitmq.sh\n"
