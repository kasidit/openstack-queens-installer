# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script with sudo or as root."
echo "install horizon.."
#read varkey

apt-get -y install openstack-dashboard

cp files/local_settings.py /etc/openstack-dashboard/local_settings.py
cp files/openstack-dashboard.conf /etc/apache2/conf-available/openstack-dashboard.conf

service apache2 reload
