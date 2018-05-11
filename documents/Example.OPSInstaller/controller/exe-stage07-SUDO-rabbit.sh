# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
# run or with sudo as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
#
# set max connection error of mysql to a high value
#
#mysql -u root -pmysqlpassword -e "SET GLOBAL max_connect_errors=10000;"
#
echo -n "* install rabbitmq.. press" 
#read varkey
apt-get -y install rabbitmq-server

echo -n "* set rabbitmq password for guest...press"
#read varkey
rabbitmqctl add_user openstack RABBIT_PASS
rabbitmqctl set_permissions openstack ".*" ".*" ".*"

printf "* install memcache..press\n"
#read varkey
apt-get install memcached python-memcache
cp files/memcached.conf /etc/memcached.conf
service memcached restart

