# OpenStack Queens installation script on Ubuntu 16.04.4 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
# run as a user
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script as a sudo user."
echo -n "1. create keystone database user..."
#read varkey
#
mysql -u root -pmysqlpassword -e "CREATE DATABASE keystone;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY 'KEYSTONE_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY 'KEYSTONE_DBPASS';"
#
