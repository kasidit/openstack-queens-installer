# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/newcompute
pwd
printf "check chrony\n"
chronyc sources
#
#printf "1. set python mysqldb\n"
#apt-get -y install python-mysqldb
