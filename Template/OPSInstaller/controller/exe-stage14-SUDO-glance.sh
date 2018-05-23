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
echo -n "Install glance..."

apt-get -y install glance 

cp files/glance-api.conf /etc/glance/glance-api.conf
cp files/glance-registry.conf /etc/glance/glance-registry.conf

echo "su -s /bin/sh -c \"glance-manage db_sync\" glance"
su -s /bin/sh -c "glance-manage db_sync" glance
#
service glance-registry restart
service glance-api restart
#
