# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
sudo /bin/bash -x ./exe-0-0-preinstall00-SUDO-set-gateway.sh 2>&1 | tee log/s00-installer.log 
printf "\nnext run ./OS-installer-00-1.sh\n"
