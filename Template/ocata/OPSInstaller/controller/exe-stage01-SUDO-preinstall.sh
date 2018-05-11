# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
cd $HOME/OPSInstaller/controller
pwd
printf "1. inspect controller's  interface/hosts files... press any key\n"
#read varkey

cat /etc/network/interfaces
cat /etc/network/hosts

printf "2. set ntp server \npress any key.."
#read varkey
apt-get -y install chrony

cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart
#
# restore later 
#cp /etc/sudoers files/sudoers.save
#echo "vasabi ALL=NOPASSWD: ALL" >> /etc/sudoers
#
# test connectivity
#ping -c 4 network
#ping -c 4 compute
