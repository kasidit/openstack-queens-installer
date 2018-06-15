# OpenStack Queens installation script on Ubuntu 16.04.4 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
# Run this with sudo or as root

#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "check chrony"
chronyc sources
sleep 1
#
apt-get -y install mariadb-server
apt-get -y install python-pymysql
#
printf "* set openstack.cnf configuration... \n" 
sleep 2
#read varkey
cp files/99-openstack.cnf /etc/mysql/mariadb.conf.d/99-openstack.cnf

service mysql restart

printf "\n *** First, enter blank for mysql password. Then set new password to\n        mysqlpassword \n*** \n" 
sleep 2
mysql_secure_installation
