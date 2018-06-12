# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
sudo /bin/bash -x ./exe-preinstall00-SUDO-update.sh 2>&1 | tee log/s00-installer.log 
/bin/bash -x ./exe-preinstall01-USER-set-remote-access.sh 2>&1 | tee log/s02.log  
/bin/bash -x ./exe-preinstall02-USER-set-openstack-nodes.sh 2>&1 | tee log/s03.log
printf "\nnext run ./OS-installer-00-2-update-ubuntu.sh\n"
