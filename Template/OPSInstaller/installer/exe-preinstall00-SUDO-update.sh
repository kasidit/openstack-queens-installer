# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
# this script or commands below must ba called
# prior to openstack installation
#
#!/bin/bash 
#

cp files/hosts /etc/hosts
cp /etc/apt/sources.list /etc/apt/sources.list.saved
cp files/local-sources.list /etc/apt/sources.list
 
#apt-get -y install ubuntu-keyring

apt-get update
#
# We assume the ubuntu OS on every host is up to date.
#
#apt-get -y dist-upgrade

echo "adjust sudoer file"
./files/adjustsudoer.sh

apt-get -y install expect sshpass
