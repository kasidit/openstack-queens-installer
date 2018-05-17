# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script with sudo or as root."
#read varkey

cp files/neutron_stage33.conf /etc/neutron/neutron.conf
#cp files/ml2_conf_stage33.ini /etc/neutron/plugins/ml2/ml2_conf.ini

service neutron-server restart
