# OpenStack Queens installation script on Ubuntu 16.04.4 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
# run or with sudo as a user.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/odl
pwd
#
apt-get install openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
echo "You have to append JAVA_HOME below to .bashrc"
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64"
echo "have to do it manually before running a new bash session."
#
wget https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/karaf/0.8.1/karaf-0.8.1.tar.gz
./bin/client
ls
cd distribution-karaf-0.5.4-Boron-SR4
ls
./bin/start
./bin/client
#
# while karaf is running add the following features if not already done it. 
feature:install odl-netvirt-openstack odl-dlux-core odl-mdsal-apidocs

on OPS controller: 
#clear all instaces, network, routers, provider nets.
sudo service neutron-server stop

on OPS network: 
sudo service neutron-openvswitch-agent stop
sudo systemctl disable neutron-openvswitch-agent
sudo service neutron-l3-agent stop
sudo systemctl disable neutron-l3-agent

on OPS compute, compute1: 
sudo service neutron-openvswitch-agent stop
sudo systemctl disable neutron-openvswitch-agent
sudo service neutron-metadata-agent stop
sudo systemctl disable neutron-metadata-agent
sudo service neutron-dhcp-agent stop
sudo systemctl disable neutron-dhcp-agent
sudo service neutron-l3-agent stop
sudo systemctl disable neutron-l3-agent

on OPS controller,network,compute,compute1: 
sudo service  openvswitch-switch stop
sudo rm -rf /var/log/openvswitch/*
sudo rm -rf /etc/openvswitch/conf.db
sudo service  openvswitch-switch start
sudo ovs-vsctl show
#
on OPS controller,network,compute,compute1:
sudo ovs-vsctl set-manager tcp:10.201.0.99:6640

on OPS network:
sudo ovs-vsctl set Open_vSwitch . other_config:local_ip=10.0.11.21
sudo ovs-vsctl show
# should see br-int
sudo ovs-vsctl get Open_vSwitch . other_config

on OPS compute: 
sudo ovs-vsctl set Open_vSwitch . other_config:local_ip=10.0.11.31
sudo ovs-vsctl show
# should see br-int
sudo ovs-vsctl get Open_vSwitch . other_config

on compute1: 
sudo ovs-vsctl set Open_vSwitch . other_config:local_ip=10.0.11.32
sudo ovs-vsctl show
# should see br-int
sudo ovs-vsctl get Open_vSwitch . other_config

# Look at the ODL web gui

On controller, network, compute, compute1: 
sudo apt-get install python-networking-odl
sudo apt install crudini

On controller:
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 mechanism_drivers opendaylight
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 tenant_network_types vxlan

vi /etc/neutron/plugins/ml2/ml2_conf.ini
[ml2_odl]
url = http://10.201.0.99:8080/controller/nb/v2/neutron
password = admin
username = admin
# do the above manually

sudo crudini --set /etc/neutron/plugins/neutron.conf DEFAULT service_plugins odl-router
sudo crudini --set /etc/neutron/plugins/dhcp_agent.ini DEFAULT force_metadata True

sudo mysql -u root -pmysqlpassword -e "DROP DATABASE IF EXISTS neutron;"
sudo mysql -u root -pmysqlpassword -e "CREATE DATABASE neutron CHARACTER SET utf8;"
sudo neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head

On network, compute, compute1:
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 mechanism_drivers opendaylight
sudo crudini --set /etc/neutron/plugins/ml2/ml2_conf.ini ml2 tenant_network_types vxlan

sudo vi /etc/neutron/plugins/ml2/ml2_conf.ini
[ml2_odl]
url = http://10.201.0.99:8080/controller/nb/v2/neutron
password = admin
username = admin
# do the above manually

sudo crudini --set /etc/neutron/plugins/neutron.conf DEFAULT service_plugins odl-router
sudo crudini --set /etc/neutron/plugins/dhcp_agent.ini DEFAULT force_metadata True

On controller: 
sudo service neutron-server restart

On network, compute, compute1: 
sudo ovs-vsctl set Open_vSwitch . other_config:provider_mappings=physnet1:ens6






